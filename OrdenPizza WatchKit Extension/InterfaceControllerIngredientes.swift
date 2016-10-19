//
//  InterfaceControllerIngredientes.swift
//  OrdenPizza
//
//  Created by Andrés Ixpec on 18/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerIngredientes: WKInterfaceController {

     var pizza = Pizza()
    
    @IBOutlet var tblIngredientes: WKInterfaceTable!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        
        tblIngredientes.setNumberOfRows(pizza.cIngredientes.count, withRowType: "NameRowControllerIdentifier")
        
        for i in 0...(pizza.cIngredientes.count-1) {
            
            let row = tblIngredientes.rowControllerAtIndex(i) as! NameRowController
            row.nameLabel.setText(pizza.cIngredientes[i])
            
        }
      
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnContinuar() {
        if pizza.vIngredientesSel.count>=1{
            pushControllerWithName("Confirmar", context: self.pizza )
          
        }
        else{
              showPopupError()
        }
        
        
    }
    
    override func table(table: WKInterfaceTable,
                        didSelectRowAtIndex rowIndex: Int){
        
        let iCtrl = table.rowControllerAtIndex(rowIndex) as! NameRowController
        
        let ingrediente : String = pizza.cIngredientes[rowIndex]
        
        if pizza.vIngredientesSel.contains(ingrediente) {
            iCtrl.nameLabel.setTextColor(UIColor.whiteColor())
            let indiceSel : Int =  pizza.vIngredientesSel.indexOf(ingrediente)!
            pizza.vIngredientesSel.removeAtIndex(indiceSel)
        }
        else{
            iCtrl.nameLabel.setTextColor(UIColor.greenColor())
            pizza.vIngredientesSel.append(ingrediente)
        }
        
        print(rowIndex)
    }
    
    func showPopupError(){
        
        // let h0 = { pushControllerWithName("selIngredientes", context: nil) }
        
        let action2 = WKAlertAction(title: "Aceptar", style: .Default) {}
        
        
        presentAlertControllerWithTitle("Aviso", message: "Selecciona al menos un ingrediente", preferredStyle: .ActionSheet, actions: [action2])
        
        
    }

}
