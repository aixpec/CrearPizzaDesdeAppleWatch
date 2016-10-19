//
//  InterfaceControllerQueso.swift
//  OrdenPizza
//
//  Created by Andrés Ixpec on 18/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerQueso: WKInterfaceController {

    var pizza = Pizza()
    
    @IBOutlet var pickQueso: WKInterfacePicker!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza =  context as! Pizza
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...pizza.cQuesos.count-1 {
            let item = WKPickerItem()
            item.title = pizza.cQuesos[i]
            item.caption = pizza.cQuesos[i]
            pickerItems.append(item)
        }
        
        pickQueso.setItems(pickerItems)
        
        pizza.vQueso = self.pizza.cQuesos[0]
        
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

    @IBAction func selectedItemPickQueso(value: Int) {
          self.pizza.vQueso = self.pizza.cQuesos[value]
    }
    
    @IBAction func clickButtonContinuar() {
           pushControllerWithName("selIngredientes", context: self.pizza) 
    }
    
 
    
}
