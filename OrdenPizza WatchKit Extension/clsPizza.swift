//
//  clsPizza.swift
//  DamePizza
//
//  Created by Andrés Ixpec on 11/10/16.
//  Copyright © 2016 Andrés Ixpec. All rights reserved.
//

import Foundation
import UIKit


class Pizza{

    
    let cTamanios = ["Pequeña","Mediana","Grande"]
    let cMasas = ["delgada", "crujiente", "gruesa"]
    let cQuesos = ["mozarela", "cheddar", "parmesano", "sin queso"]
    let cIngredientes = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    
    
    var vTamanio : String?
    var vMasa : String?
    var vQueso : String?
    var vIngredientesSel : [String] = []
    
    
    func pizzaCompleta() ->Bool{
        
        if (vTamanio == nil) != nil  && (vMasa == nil) != nil && (vQueso == nil) != nil && vIngredientesSel.count>=1 {
            return true
        }
        else{
            return false
        }
        
    }
    
    
    
    
}
