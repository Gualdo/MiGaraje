//
//  Car.swift
//  Mi Garaje
//
//  Created by Eduardo D De La Cruz Marr on 15/2/17.
//  Copyright © 2017 Eduardo D De La Cruz Marrero. All rights reserved.
//

import Foundation
import UIKit

class Car : NSObject
{
    var cv : Int!
    var build : String!
    var model : String!
    var color : UIColor!
    var kms : Int!
    var image : UIImage? //Opcional
    
    override var description : String // Es una variable / metodo propio de swift util para cuando se pide que se imprima un car sin poner que del car quieres imprimir y se llama propiedades computadas, no son valores que se pueden modificar sino que son fijos
    {
        return "Mi coche es un \(model!), tiene \(cv!) caballos de potencia y llevo hechos \(kms!) kms"
    }
    
    override init() //Constructor por defecto modificado por el programador
    {
        cv = 0
        build = "Desconocido"
        model = "Desconocdo"
        color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        kms = 0
    }
    
    init(cv: Int , build : String , model : String , color : UIColor , kms : Int , image : UIImage?) // Constructor creado por el programador
    {
        self.cv = cv
        self.build = build
        self.model = model
        self.color = color
        self.kms = kms
        if let image = image //Optional binding
        {
            self.image = image
        }
    }
    
    func addKms(kmsToAdd : Int!)
    {
        self.kms = self.kms + kmsToAdd
    }
    
    func accelerate()
    {
        print("Brrrrrrrrrrrrrmmmmmmmmm!!!")
    }
    
    class func maxSpeed() -> Int //Funcion que tienen todas las instancias al mismo tiempo
    {
        return 120
    }
    
    func powerToWatts() -> Int
    {
        return 735 * self.cv
    }
}
