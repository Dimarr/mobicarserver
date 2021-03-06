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
                        str = "Pincode sent successfully";
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

                if (tokens[0].equalsIgnoreCase("spsettoken")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.setToken(tokens[1], tokens[2]);  // email, BN or ID
                        str = "Set token " + tokens[2] + " for sp #" + tokens[1];
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
                    if (tokens.length < 4) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer uid = null;
                        //if (Integer.valueOf(tokens[1]) == 0) {
                        uid = Serviceprovider.LogedLite(tokens[2], tokens[3], tokens[1]);  // email
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

                if (tokens[0].equalsIgnoreCase("search")) {
                    if (tokens.length < 7) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = User.listsp(tokens[1], tokens[2], tokens[3], tokens[4], tokens[5], tokens[6]);
                        //Service ID, User ID, coordinats X and Y, car type, top
                    }
                }

                if (tokens[0].equalsIgnoreCase("updatesp")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Serviceprovider.updatesp(Integer.parseInt(tokens[1]));
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
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
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
                                } catch (FileNotFoundException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("viewcalls")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        //flag = true;
                        Integer uid = Integer.valueOf(tokens[1]);
                        Integer cs = Integer.valueOf(tokens[2]);
                        if (uid > 0) {
                            User usr = new User(uid);
                            str = usr.ViewCallsSQL(cs);
                        } else {
                            System.out.println("params aren't correct");
                            str = "*";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("viewpayments")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        Integer uid = Integer.valueOf(tokens[1]);
                        if (uid > 0) {
                            User usr = new User(uid);
                            str = usr.ViewPaymentsSQL();
                        } else {
                            System.out.println("params aren't correct");
                            str = "*";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("addcall")) {
                    if (tokens.length < 5) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        Integer uid = Integer.valueOf(tokens[1]);
                        if (uid > 0) {
                            User usr = new User(uid);
                            String cd = tokens[2];
                            Integer spid = Integer.valueOf(tokens[3]);
                            Integer serviceid = Integer.valueOf(tokens[4]);
                            usr.AddCallSQL(cd, spid, serviceid);
                            str = "Request for service provider #" + tokens[3] + " added";
                        } else {
                            System.out.println("params aren't correct");
                            str = "*";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("getnewreqforsp")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "*";
                    } else {
                        Integer spid = Integer.valueOf(tokens[1]);
                        str = Serviceprovider.GetNewRequestsSP(spid);
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

                if (tokens[0].equalsIgnoreCase("acceptcall")) {
                    if (tokens.length < 3) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer callid = Integer.valueOf(tokens[1]);
                        Integer spid = Integer.valueOf(tokens[2]);
                        if (spid > 0) {
                            Serviceprovider sp = new Serviceprovider(spid);
                            try {
                                sp.AcceptCall(callid);
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            System.out.println("Accepted call #" + callid);
                            str = String.valueOf(callid);
                        } else {
                            System.out.println("params aren't correct");
                            str = "-1";
                        }
                    }
                }

                if (tokens[0].equalsIgnoreCase("rejectcall")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        Integer callid = Integer.valueOf(tokens[1]);
                        if (callid > 0) {
                            Serviceprovider.RejectCall(callid);
                            str = String.valueOf(callid);
                            System.out.println("Rejected call #" + callid);
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
                        str = "Service ID" + tokens[2] + " linked to Customer ID" + tokens[1];
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

                if (tokens[0].equalsIgnoreCase("getservices")) {
                    if (tokens.length < 2) {
                        System.out.println("params aren't correct");
                        str = "-1";
                    } else {
                        str = Serviceprovider.getServices(tokens[1]);
                    }
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
