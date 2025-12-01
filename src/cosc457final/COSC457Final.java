/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cosc457final;

import my.cosc457final.*;

/**
 *
 * @author nk
 */
public class COSC457Final {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        //Run and render FinalUI
        java.awt.EventQueue.invokeLater(new Runnable(){
            public void run(){
                new FinalUI().setVisible(true);
            }
        });
    }
    
}
