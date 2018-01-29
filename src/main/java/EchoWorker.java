import Objects.Crypt;
import Objects.Serviceprovider;
import Objects.User;

import java.io.FileNotFoundException;
import java.nio.channels.SocketChannel;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class EchoWorker implements Runnable {
	private List queue = new LinkedList();
	
	public void processData(NioServer server, SocketChannel socket, byte[] data, int count) {
		byte[] dataCopy = new byte[count];
		System.arraycopy(data, 0, dataCopy, 0, count);
		synchronized(queue) {
			queue.add(new ServerDataEvent(server, socket, dataCopy));
			queue.notify();
		}
	}

    public byte [] exec (byte [] dt) throws SQLException {
        String delims = "[,]+";
        String str = new String(dt);
        str =str.substring(0,str.length()-2);
        String[] tokens = str.split(delims);

        if (tokens.length == 0) {
            System.out.println("API command has missed");
            str = "API command has missed";
        } else {
            if (tokens[0].equalsIgnoreCase("user")) try {
                if (tokens.length < 3) {
                    System.out.println("params aren't correct");
                    str ="-1";
                }else{
                    Integer uid;
                    if (tokens.length == 3) {
                        uid = User.Loged(tokens[1], tokens[2], 0);
                    } else {
                        uid = User.Loged(tokens[1], tokens[2], Integer.parseInt(tokens[3]));
                    }
                    if (uid > -1) {
                        System.out.println("User with username " + tokens[1] + " signed in successfully");
                    } else {
                        System.out.println("User with username " + tokens[1] + " is not found or username\\password is not correct");
                    }
                    str=uid.toString();
                }
                //out.print();
                //System.out.println(uid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (tokens[0].equalsIgnoreCase("sptokengen")) {
            try {
                String phone;
                String createdToken;
                String pincode;
                if (tokens.length < 3) {
                    System.out.println("params aren't correct");
                    str = "-1";
                } else {
                    if (Integer.parseInt(tokens[1]) > 0) {
                        if (tokens.length == 4) {
                            Serviceprovider.setphone(Integer.parseInt(tokens[1]), tokens[3]);
                            phone = tokens[3];
                        } else {
                            phone = Serviceprovider.getphone(Integer.parseInt(tokens[1]));
                        }
                        createdToken = MyToken.newToken(phone, tokens[2]);
                        //System.out.println("Token generated successfully");
                        pincode= Crypt.rnd(10000,99999);
                        if (pincode.trim().length()<4) {pincode=pincode+"000"; pincode=pincode.substring(0,4);}

                        new SendAuthSMS(phone, "Your verification code is "+pincode);
                        str = "Pincode sent successfully";
                        if (Integer.parseInt(tokens[1]) > 0) {
                            Serviceprovider.Setpincode(tokens[1],pincode);
                            Serviceprovider.SetToken(tokens[1], createdToken);
                        }
                    } else {
                        if (tokens.length > 3) {
                            phone = tokens[3];
                            str = MyToken.newToken(phone, tokens[2]);
                            System.out.println("Token generated successfully");
                            new SendAuthSMS(phone, "Your token created successfully");
                            //str = "Token generated successfully";
                            if (Integer.parseInt(tokens[1]) > 0) Serviceprovider.SetToken(tokens[1], str);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }
            } catch (Exception e) {
                str = e.getMessage();
                e.printStackTrace();
            }
        }

        if (tokens[0].equalsIgnoreCase("spverifypincode")) {
            if (tokens.length < 3) {
                System.out.println("params aren't correct");
                str = "-1";
            } else {
                if (Serviceprovider.Verifypincode(tokens[1], tokens[2])>0) {
                    str=Serviceprovider.GetToken(tokens[1]);
                } else {
                    //str="Verification does not passed";
                    str="-1";
                }
            }
        }


        if (tokens[0].equalsIgnoreCase("tokengen")) {
            try {
                String phone;
                String createdToken;
                String pincode;
                if (tokens.length < 3) {
                    System.out.println("params aren't correct");
                    str = "-1";
                } else {
                    if (Integer.parseInt(tokens[1]) > 0) {
                        if (tokens.length == 4) {
                            User.setphone(Integer.parseInt(tokens[1]), tokens[3]);
                            phone = tokens[3];
                        } else {
                            phone = User.getphone(Integer.parseInt(tokens[1]));
                        }
                        createdToken = MyToken.newToken(phone, tokens[2]);
                        //System.out.println("Token generated successfully");
                        pincode= Crypt.rnd(1000,9999);
                        new SendAuthSMS(phone, "Your verification code is "+pincode);
                        str = "Pincode has been sent successfully";
                        if (Integer.parseInt(tokens[1]) > 0) {
                            User.Setpincode(tokens[1],pincode);
                            User.SetToken(tokens[1], createdToken);
                        }
                    } else {
                        if (tokens.length > 3) {
                            phone = tokens[3];
                            str = MyToken.newToken(phone, tokens[2]);
                            System.out.println("Token generated successfully");
                            new SendAuthSMS(phone, "Your token created successfully");
                            //str = "Token generated successfully";
                            if (Integer.parseInt(tokens[1]) > 0) User.SetToken(tokens[1], str);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }
            } catch (Exception e) {
                str = e.getMessage();
                e.printStackTrace();
            }
        }

        if (tokens[0].equalsIgnoreCase("verifypincode")) {
            if (tokens.length < 3) {
                System.out.println("params aren't correct");
                str = "-1";
            } else {
                if (User.Verifypincode(tokens[1], tokens[2])>0) {
                    str=User.GetToken(tokens[1]);
                } else {
                    //str="Verification does not passed";
                    str="-1";
                }
            }
        }
                if (tokens[0].equalsIgnoreCase("usersettoken")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.SetToken(tokens[1], tokens[2]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("userlite")) try {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer uid;
                        if (tokens.length == 2) {
                            uid = User.LogedLite(tokens[1], 0);
                        } else {
                            uid = User.LogedLite(tokens[1], Integer.parseInt(tokens[2]));
                        }
                        if (uid > -1) {
                            System.out.println("User with username " + tokens[1] + " signed in successfully");
                        } else {
                            System.out.println("User with username " + tokens[1] + " is not found or username\\password is not correct");
                        }
                        str = uid.toString();
                    }
                    //out.print();
                    //System.out.println(uid);
                } catch (SQLException e) {
                    e.printStackTrace();
                }


                if (tokens[0].equalsIgnoreCase("userlogout")) try {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.Logout(tokens[1]);
                        str = "exit";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (tokens[0].equalsIgnoreCase("splogout")) try {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.Logout(tokens[1]);
                        str = "exit";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (tokens[0].equalsIgnoreCase("spsetfirebasetoken")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setFirebaseToken(tokens[1], tokens[2]);
                        str = "Set FireBase token for sp #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("usersetfirebasetoken")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.SetFirebaseToken(tokens[1], tokens[2]);
                        str = "Set FireBase token for user #" + tokens[1];
                    }
                }

        if (tokens[0].equalsIgnoreCase("spsettoken")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setToken(tokens[1], tokens[2]);  // email, BN or ID
                        str = "Set token " + tokens[2] + " for sp #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgetstaticxy")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getstaticxy(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgetxy")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getxy(tokens[1]);
                    }
                }
                if (tokens[0].equalsIgnoreCase("usergetxy")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.getxy(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("addnewpayment")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.AddNewPayment(tokens[1], tokens[2], Float.parseFloat(tokens[3]), tokens[4]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("setpaymentstatus")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.SetPaymentStatus(tokens[1], tokens[2]);
                        str = "Set Status " + tokens[2] + " for Payment#" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("getpayments")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.GetPayments(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("searchservice")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.searchservice(Integer.valueOf(tokens[1]), Integer.valueOf(tokens[2]), Integer.valueOf(tokens[3]));
                    }
                }

                if (tokens[0].equalsIgnoreCase("spsavexy")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.saveXY(tokens[1], tokens[2], tokens[3]);  // spID, X, Y
                        str = "Save coordinates for Service Provider #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("usersavexy")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.saveXY(tokens[1], tokens[2], tokens[3]);  // userID, X, Y
                        str = "Save coordinates for User #" + tokens[1];
                    }
                }
                if (tokens[0].equalsIgnoreCase("usersetxy")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.SetXY(Integer.valueOf(tokens[1]), Float.parseFloat(tokens[2]), Float.parseFloat(tokens[3]));  // userID, X, Y
                        str = "Set coordinates for User #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgettoken")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getToken(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgetfirebasetoken")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getFirebaseToken(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("usergetfirebasetoken")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.GetFirebaseToken(tokens[1]);
                    }
                }

        if (tokens[0].equalsIgnoreCase("spsetbusy")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setBusy(tokens[1]);
                        str = "Set status busy for sp #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgetbusy")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getBusy(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("userattempt")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        User.setAttempt(tokens[1]);
                        str = "Failed Login";
                    }
                }

                if (tokens[0].equalsIgnoreCase("splite")) try {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer uid = null;
                        //if (Integer.valueOf(tokens[1]) == 0) {
                        if (tokens.length==4)
                            uid = Serviceprovider.LogedLite(tokens[2], tokens[3], tokens[1]);  // email or phone
                        else
                            uid = Serviceprovider.LogedLite(tokens[2],"", tokens[1]);  // email or phone

                /*} else {
                    if (Integer.valueOf(tokens[1]) == 1) {
                        uid = Serviceprovider.LogedLite("",tokens[2]);  // BN or ID
                    } else {
                        uid = Serviceprovider.LogedLite(tokens[2],tokens[3]);  // email and BN or ID
                    }
                } */

                        if (uid > -1) {
                            System.out.println("Service provider with username " + tokens[2] + " signed in successfully");
                        } else {
                            //Serviceprovider sp = new Serviceprovider(uid);
                            System.out.println("Service provider with username " + tokens[2] + " is not found");
                        }
                        str = String.valueOf(uid);
                    }
                    //out.print();
                    //System.out.println(uid);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (tokens[0].equalsIgnoreCase("sp")) try {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        //flag = true;
                        Integer uid = Serviceprovider.Loged(tokens[1], tokens[2], tokens[3]);  // email, BN or ID, password
                        if (uid > -1) {
                            System.out.println("Service provider with username " + tokens[1] + " signed in successfully");
                        } else {
                            //Serviceprovider sp = new Serviceprovider(uid);
                            System.out.println("Service provider with username " + tokens[1] + " is not found");
                        }
                        str = String.valueOf(uid);
                    }
                    //out.print();
                    //System.out.println(uid);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (tokens[0].equalsIgnoreCase("json")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        String res = tokens[1];
                        if (tokens.length > 3) {
                            for (int i = 2; i < tokens.length - 1; i = i + 1) {
                                res += "," + tokens[i];
                            }
                        }
                        str = User.jsonrs(res, tokens[2]);
                    }
                }


                if (tokens[0].equalsIgnoreCase("getspbankdetails")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getBankDetailsForSP(Integer.valueOf(tokens[1]));  //SpID
                    }
                }

                if (tokens[0].equalsIgnoreCase("setspbank")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setBankForSP(Integer.valueOf(tokens[1]), Integer.valueOf(tokens[2]), tokens[3], tokens[4]);  //SpID, BankID, Branch, Account
                    }
                }

                if (tokens[0].equalsIgnoreCase("getallservices")) str = Serviceprovider.getAllServices();

                if (tokens[0].equalsIgnoreCase("getalllocations")) str = Serviceprovider.getAllLocations();

                if (tokens[0].equalsIgnoreCase("search")) {
                    if (tokens.length < 8) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.listsp(tokens[1], tokens[2], tokens[3], tokens[4], tokens[5], tokens[6],tokens[7]);
                        //Service ID, , subservid,User ID, coordinats X and Y, locationid, top
                    }
                }

                 if (tokens[0].equalsIgnoreCase("getsubservice")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getSubService(tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("createuserlite")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = String.valueOf(User.NewuserLite(tokens[1], tokens[2], tokens[3], tokens[4]));
                        // fname, lname, email,  phone
                        System.out.println("Created user: First Name is " + tokens[1] + ", Last Name is " + tokens[2]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("createuser")) {
                    if (tokens.length < 11) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        //flag = true;
                        Integer uid = User.Newuser(tokens[1], tokens[2], tokens[3], tokens[4], tokens[5], tokens[6], tokens[7], tokens[8], tokens[9], tokens[10]);
                        // fname, lname, email,  pwd,  cc,  phone, cartype, car brand, car model, car number
                        str = String.valueOf(uid);
                        System.out.println("Created user: First Name is " + tokens[1] + ", Last Name is " + tokens[2]);
                        if (tokens.length > 11) {
                            if (!tokens[11].isEmpty()) {   //Path to Picture
                                try {
                                    User.InsertPicUser(tokens[8], uid);
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                } catch (FileNotFoundException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("picuser")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        try {
                            User.InsertPicUser(tokens[1], Integer.valueOf(tokens[2]));
                            str = tokens[2];
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("picsp")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        try {
                            Serviceprovider.InsertPicSP(tokens[1], Integer.valueOf(tokens[2]));
                            str = tokens[2];
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("createsplite")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        if (tokens.length == 6) {
                            str = Serviceprovider.Newsplite(tokens[1], tokens[2], tokens[3], tokens[4], tokens[5]);
                        } else {
                            str = Serviceprovider.Newsplite(tokens[1], tokens[2], tokens[3], tokens[4], "");
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("createsp")) {
                    if (tokens.length < 19) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer spid = Serviceprovider.Newsp(tokens[1], tokens[2], tokens[3], tokens[4], Float.parseFloat(tokens[7]), Float.parseFloat(tokens[8]),
                                tokens[5], tokens[6], tokens[9], tokens[10], tokens[11], tokens[12], tokens[13], tokens[14], tokens[15], tokens[16], tokens[17], tokens[18]);  // fname, address,
                        str = String.valueOf(spid);
                        System.out.println("Created Service Provider: Name is " + tokens[1]);
                        if (tokens.length > 19) {
                            if (!tokens[19].isEmpty()) {   //Path to Picture
                                try {
                                    Serviceprovider.InsertPicSP(tokens[19], spid);
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("spsetstaticxy")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setStaticXY(tokens[1],tokens[2],tokens[3]);
                        str ="Coordinates updated";
                    }
                }

                if (tokens[0].equalsIgnoreCase("viewcalls")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "";
                    } else {
                        //flag = true;
                        Integer uid = Integer.valueOf(tokens[1].trim());
                        Integer cs = Integer.valueOf(tokens[2].trim());
                        if (uid > 0) {
                            User usr = new User(uid);
                            str = usr.ViewCalls(cs);
                        } else {
                            System.out.println("params aren't correct");
                            str = "";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("viewpayments")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "";
                    } else {
                        Integer uid = Integer.valueOf(tokens[1].trim());
                        if (uid > 0) {
                            str = User.ViewPayments(tokens[1].trim());
                        } else {
                            System.out.println("params aren't correct");
                            str = "";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("addcall")) {
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        String cdetail="";
                        if (tokens.length > 4) cdetail=tokens[4].trim();
                        Integer uid = Integer.valueOf(tokens[1].trim());
                        if (uid > 0) {
                            str=User.AddCall(tokens[1],cdetail, tokens[2].trim(),tokens[3].trim());
                            //str = "Request for service provider #" + tokens[3] + " added";
                        } else {
                            System.out.println("params aren't correct");
                            str = "*";
                        }
                    }
                }


                if (tokens[0].equalsIgnoreCase("usersetcarid")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        User.SetCarID(Integer.valueOf(tokens[1]), Integer.valueOf(tokens[2]), Integer.valueOf(tokens[3]), tokens[4]);
                        str = "Car detals updated for User with ID #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("spsetcarid")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        Serviceprovider.SetCarID(Integer.valueOf(tokens[1]), Integer.valueOf(tokens[2]), Integer.valueOf(tokens[3]), tokens[4]);
                        str = "Car detals updated for SP with ID #" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("usergetcarid")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        str = User.GetCarID(Integer.valueOf(tokens[1]));
                    }
                }

                if (tokens[0].equalsIgnoreCase("spgetcarid")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        str = Serviceprovider.GetCarID(Integer.valueOf(tokens[1]));
                    }
                }

                if (tokens[0].equalsIgnoreCase("getsellerid")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        str = Serviceprovider.GetSellerID(Integer.valueOf(tokens[1]));
                    }
                }

                if (tokens[0].equalsIgnoreCase("setsellerid")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        Serviceprovider.SetSellerID(Integer.valueOf(tokens[1]), tokens[2]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("getcarlistforsp")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        str = Serviceprovider.GetCarList(Integer.valueOf(tokens[1]));
                    }
                }

                if (tokens[0].equalsIgnoreCase("acceptjob")) {
                    if (tokens.length < 2) {
                        str = "-1";
                        System.out.println("params aren't correct");
                    } else {
                        Integer payid = Integer.valueOf(tokens[1]);
                        if (payid > 0) {
                            User.AcceptJob(payid);
                            System.out.println("Accepted payment #" + payid);
                            str = String.valueOf(payid);
                        } else {
                            str = "-1";
                            System.out.println("params aren't correct");
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("sponlinestatus")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        if (tokens.length==2) {
                            str = Serviceprovider.onlineStatus(tokens[1],"");
                        } else {
                            str = Serviceprovider.onlineStatus(tokens[1],tokens[2]);
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("declinejob")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer payid = Integer.valueOf(tokens[1]);
                        if (payid > 0) {
                            User.DeclineJob(payid);
                            System.out.println("Rejected payment #" + payid);
                            str = String.valueOf(payid);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("askforpayment")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.AskPaymentCall(tokens[1]);
                        str = String.valueOf("Ask for payment for SP #" + tokens[1]);
                    }
                }

                if (tokens[0].equalsIgnoreCase("acceptcall")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        //Integer callid = Integer.valueOf(tokens[1]);
                        Integer spid = Integer.valueOf(tokens[1]);
                        if (spid > 0) {
                            try {
                                Serviceprovider.AcceptCall(tokens[1]);
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            System.out.println("Accepted call for SP #" + tokens[1]);
                            str = String.valueOf("Accepted call for SP #" + tokens[1]);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("spstatuscall")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.StatusCall(tokens[1].trim());
                    }
                }

                if (tokens[0].equalsIgnoreCase("userstatuscall")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.StatusCall(tokens[1].trim());
                    }
                }

                if (tokens[0].equalsIgnoreCase("rejectcall")) {
                            if (tokens.length < 2) {
                                System.out.println("params aren't correct");
                                str = "-1";
                            } else {
                                Integer spid = Integer.valueOf(tokens[1]);
                                if (spid > 0) {
                                    Serviceprovider.RejectCall(tokens[1]);
                                    str = "SP #"+tokens[1]+" rejected call";
                                    System.out.println("SP #"+tokens[1]+" rejected call" );
                                } else {
                                    System.out.println("params aren't correct");
                                    str = "-1";
                                }
                            }
                        }

                        if (tokens[0].equalsIgnoreCase("addservice")) {
                            if (tokens.length < 7) {
                                System.out.println("params aren't correct");
                                str = "-1";
                            } else {
                                Serviceprovider.addService(tokens[1], tokens[2], tokens[3], tokens[4], tokens[5], tokens[6]);
                                str = "Service with ID# " + tokens[2] + " is linked to Service Provider# " + tokens[1];
                            }
                        }


                if (tokens[0].equalsIgnoreCase("delservice")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.delService(tokens[1], tokens[2]);
                        str = "Service ID" + tokens[2] + " unlinked from Customer ID" + tokens[1];
                    }
                }

                if (tokens[0].equalsIgnoreCase("getservicesforsp")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getServices(tokens[1]);
                    }
                }

        if (tokens[0].equalsIgnoreCase("encode")) {
            if (tokens.length < 2) {
                System.out.println("params aren't correct");
                str = "-1";
            } else {
                str= Crypt.encode(tokens[1],"!mobi!car@#$");
            }
        }

        if (tokens[0].equalsIgnoreCase("decode")) {
            if (tokens.length < 2) {
                System.out.println("params aren't correct");
                str = "-1";
            } else str = Crypt.decode(tokens[1], "!mobi!car@#$");
        }

                if (tokens[0].equalsIgnoreCase("setrating")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        //flag = true;
                        Integer spid = Integer.valueOf(tokens[1]);
                        Integer rating = Integer.valueOf(tokens[2]);
                        if (spid > 0) {
                            Integer newrate = User.SetRating(spid, rating);
                            System.out.println("For Service Provider #" + spid + " calculated rating: " + newrate);
                            str = String.valueOf(newrate);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }

                str += "\r\n";
                return str.getBytes();
            }

	public void run() {
		ServerDataEvent dataEvent;
		
		while(true) {
			// Wait for data to become available
			synchronized(queue) {
				while(queue.isEmpty()) {
					try {
						queue.wait();
					} catch (InterruptedException e) {
					}
				}
				dataEvent = (ServerDataEvent) queue.remove(0);
			}
			
			// Return to sender

            try {
                dataEvent.server.send(dataEvent.socket,exec(dataEvent.data));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}
