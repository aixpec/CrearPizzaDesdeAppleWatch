//
//  InterfaceControllerConfirmar.swift
//  OrdenPizza
//
//  Created by Andrés Ixpec on 18/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerConfirmar: WKInterfaceController {

    
    var pizza = Pizza()
    var orden : String = ""
    
    @IBOutlet var lblOrden: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        orden = "Una Pizza \(pizza.vTamanio!) de masa \(pizza.vMasa!) queso \(pizza.vQueso!)  "
        
        for i in 0...(pizza.vIngredientesSel.count-1) {
            orden = orden + ", " + pizza.vIngredientesSel[i]
        }
        
        
        lblOrden.setText(orden)
        
       
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
 
    @IBAction func clickButtonConfirmar() {
        
        if pizza.pizzaCompleta(){
            showPopup()
        }
        else{
            showPopupError()
        }
        
        
    }
    
    func showPopup(){
        
       // let h0 = { pushControllerWithName("selIngredientes", context: nil) }
        
        let action1 = WKAlertAction(title: "Si", style: .Default, handler:funcRegresarAInicio)
        let action2 = WKAlertAction(title: "No", style: .Destructive) {}
     
        
        presentAlertControllerWithTitle("Confirmar Orden?", message: "", preferredStyle: .ActionSheet, actions: [action1, action2])
        
        
    }
    
    func showPopupError(){
        
        // let h0 = { pushControllerWithName("selIngredientes", context: nil) }
     
        let action2 = WKAlertAction(title: "Aceptar", style: .Default) {}
        
        
        presentAlertControllerWithTitle("Orden incompleta", message: "", preferredStyle: .ActionSheet, actions: [action2])
        
        
    }
    
    func funcRegresarAInicio(){
        pushControllerWithName("selInicio", context: 1)
    }

}
