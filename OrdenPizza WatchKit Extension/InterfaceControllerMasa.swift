//
//  InterfaceControllerMasa.swift
//  OrdenPizza
//
//  Created by Andrés Ixpec on 18/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerMasa: WKInterfaceController {

    
    var pizza = Pizza()
    
    @IBOutlet var pickMasa: WKInterfacePicker!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...pizza.cMasas.count-1 {
            let item = WKPickerItem()
            item.title = pizza.cMasas[i]
            item.caption = pizza.cMasas[i]
            pickerItems.append(item)
        }
        
        pickMasa.setItems(pickerItems)
        
        pizza.vMasa = self.pizza.cMasas[0]
       
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func selectedItemMasa(value: Int){
        pizza.vMasa = self.pizza.cMasas[value]
    }
    
    
    @IBAction func clickButtonContinuar() {
        pushControllerWithName("selQueso", context: self.pizza)
    }

}
