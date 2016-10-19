//
//  InterfaceController.swift
//  OrdenPizza WatchKit Extension
//
//  Created by Andrés Ixpec on 18/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    var pizza = Pizza()
    
    @IBOutlet var pickTamanio: WKInterfacePicker!
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let edoOrden = context{
            if (edoOrden as! Int) == 1 {showPopup()}
        }
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...pizza.cTamanios.count-1 {
            let item = WKPickerItem()
            item.title = pizza.cTamanios[i]
            item.caption = pizza.cTamanios[i]
            pickerItems.append(item)
        }
        
        pickTamanio.setItems(pickerItems)
        
        pizza.vTamanio = self.pizza.cTamanios[0]
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func selectedItemPickTamanio(value: Int) {
        
         pizza.vTamanio = self.pizza.cTamanios[value]
    }
    
    
    @IBAction func clickButtonContinuar() {
         pushControllerWithName("Sel_Masa", context: self.pizza)
    }
        
        
    
    func showPopup(){
        
         let h0 = { print("ordenEnviada") }
        
        let action1 = WKAlertAction(title: "Aceptar", style: .Default, handler:h0)

        
        
        presentAlertControllerWithTitle("Orden enviada a la cocina", message: "", preferredStyle: .ActionSheet, actions: [action1])
        
        
    }
    
   

    

}
