package Objects;

import DBMain.JavaToMySQL;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Created by SBT-Rumyantsev-DK on 19.09.2016.
 */
public class showresults {
    public static String objid;
    public showresults(ResultSet rs, String frametitle, String btntitle) throws SQLException, ClassNotFoundException {
            //ResultSet rs = st.executeQuery(query);
            DatabaseTableModel model = new DatabaseTableModel();
            model.setDataSource(rs);

            final JTable table = new JTable(model);

        table.addMouseListener(new MouseListener() {
            public void mouseClicked(MouseEvent event) {
                //System.out.println("after click "+objid.trim());
                objid= table.getValueAt(table.getSelectedRow(),0).toString();
            }
            public void mouseEntered(MouseEvent event) {
            }
            public void mouseExited(MouseEvent event) {
            }
            public void mousePressed(MouseEvent event) {
            }
            public void mouseReleased(MouseEvent event) {
            }
        });

            JPanel panel = new JPanel(new BorderLayout());

            panel.add(new JScrollPane(table), BorderLayout.CENTER);

            final JDialog frame = new JDialog();

        frame.getContentPane().add(panel,
                BorderLayout.CENTER);
        if (!btntitle.equals("")) {
            JButton button = new JButton(btntitle);
            final ActionListener alist = new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    //System.out.println("before update "+objid.trim());
                    JavaToMySQL jts = new JavaToMySQL();
                    jts.DbExec("UPDATE spec SET value='"+objid.trim()+"';");

                    frame.dispose();
                }
            };
            button.addActionListener(alist);
            frame.getContentPane().add(button,BorderLayout.SOUTH);
        };
        frame.setTitle(frametitle);

            frame.setSize(500, 400);


            frame.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);

        frame.setModal(true);
        frame.setAlwaysOnTop(true);
        frame.setVisible(true);

            //WindowListener winListener = new TestWindowListener();
            //frame.addWindowListener(winListener);

            frame.pack();
            frame.doLayout();

    };

/*    public static class TestWindowListener implements WindowListener {
        public void windowActivated(WindowEvent e) {
            //System.out.println("windowActivated");
        }
        public void windowClosed(WindowEvent e) {
            System.out.println("before update "+objid.trim());
            System.out.println("windowClosed");
            JavaToMySQL jts = new JavaToMySQL();
            jts.DbExec("UPDATE spec SET value='"+objid.trim()+"';");
        }
        public void windowClosing(WindowEvent e) {
            System.out.println("windowClosing");
        }
        public void windowDeactivated(WindowEvent e) {
            System.out.println("windowDeactivated");
        }
        public void windowDeiconified(WindowEvent e) {
            System.out.println("windowDeiconified");
        }
        public void windowIconified(WindowEvent e) {
            System.out.println("windowIconified");
        }
        public void windowOpened(WindowEvent e) {
            System.out.println("windowOpened");
        }
    }*/
}
