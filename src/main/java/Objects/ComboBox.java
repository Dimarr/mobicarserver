package Objects;

import DBMain.JavaToMySQL;
import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.event.ListDataListener;
/**
 * Created by DR on 22.08.2016.
 */
public class ComboBox {
    public int combid;
    public ComboBox(final String combolabel, final String combotitle, final String ctable) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                ComboBoxFrame frame = new ComboBoxFrame(combolabel,combotitle, ctable);
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setVisible(true);

                combid=frame.GetID();
            }
        });

        //}

    }
}
class ComboBoxFrame extends JFrame {
    public int comid;
    public int GetID(){
        return comid;
    };
    public ComboBoxFrame(String CLabel, String CTitle, String CTable) {
        setTitle(CLabel);
        setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);

        label = new JLabel(CTitle);
        label.setFont(new Font("Serif", Font.PLAIN, DEFAULT_SIZE));
        add(label, BorderLayout.NORTH);

        JavaToMySQL javaToMySQL = new JavaToMySQL();
        ArrayList<String> resultSet = javaToMySQL.DbSelect(CTable,1,2);
        faceCombo = new JComboBox();
        faceCombo.setEditable(false);

        for(int i = 0; i < resultSet.size(); i++) {
            faceCombo.addItem(resultSet.get(i));
        } ;
        JButton button = new JButton("Select service");
        ActionListener actionListener = new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                comid = faceCombo.getSelectedIndex() + 1;
            }
        };
        button.addActionListener(actionListener);
        faceCombo.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent event) {
                //label.setFont(new Font((String) faceCombo.getSelectedItem(),Font.PLAIN,DEFAULT_SIZE));
                //System.out.println(faceCombo.getSelectedIndex());

            }
        });

        JPanel comboPanel = new JPanel();
        comboPanel.add(faceCombo);
        comboPanel.add(button);
        add(comboPanel, BorderLayout.CENTER);
    }
    public static final int DEFAULT_WIDTH = 200;
    public static final int DEFAULT_HEIGHT = 200;

    private JComboBox faceCombo;
    private JLabel label;
    private static final int DEFAULT_SIZE = 12;
}
