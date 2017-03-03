//
//  ViewController.swift
//  Mi Garaje
//
//  Created by Eduardo D De La Cruz Marr on 15/2/17.
//  Copyright © 2017 Eduardo D De La Cruz Marrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    var myGarage : [Car] = []
    var myCar : Car!
    var carID : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myCar = Car(cv: 140, build: "Peugeot", model: "207 CC", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), kms: 42000 , image : nil)
        myGarage.append(myCar)
        
        myCar = Car(cv: 80, build: "Citroen", model: "Jumpy", color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), kms: 180000 , image : #imageLiteral(resourceName: "citroen"))
        myGarage.append(myCar)
        
        myCar = Car(cv: 300, build: "Ferrari", model: "Italia", color: #colorLiteral(red: 1, green: 0.1407921208, blue: 0, alpha: 1) , kms: 2000 , image : #imageLiteral(resourceName: "ferrari"))
        myGarage.append(myCar)
        
        myCar = Car(cv: 60, build: "Fiat", model: "500", color: #colorLiteral(red: 0.9396712184, green: 0.266363333, blue: 0.002487650812, alpha: 1), kms: 200000 , image : #imageLiteral(resourceName: "fiat"))
        myGarage.append(myCar)
        
        carID = 0
        
        updateView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView()
    {
        myCar = myGarage[carID]
        
        UIView.animate(withDuration: 1.5, delay: 0.25, options: [.transitionCurlUp , .allowUserInteraction],
                       animations: {
                                        if self.myCar.image != nil
                                        {
                                            self.imageView.image = self.myCar.image
                                        }
                                        else
                                        {
                                            self.imageView.image = nil
                                        }
            
                                        self.label1.text = "\(self.myCar.build!) \(self.myCar.model!)"
                                        self.label2.text = "CV : \(self.myCar.cv!) - W : \(self.myCar.powerToWatts())"
                                        self.label3.text = "Kms : \(self.myCar.kms!)"
            
                                        self.view.backgroundColor = self.myCar.color // Pone el fondo de la vista del mismo color del carro
                                    })
                                    { (completed) in //Esto es opcional si en vez de darle enter se le pone nil no hace nada
                                        print("Amimacion completada! Recuerda que la velocidad maxima en España es \(Car.maxSpeed())") //No se llama al objeto en especifico ya que maxSpeed es una class function
                                    }
    }
    
    @IBAction func changeCar(_ sender: UIButton)
    {
        carID += 1
        if carID >= myGarage.count
        {
            carID = 0
        }
        
        updateView()
    }
    
    @IBAction func acceleratePressed(_ sender: UIButton)
    {
        self.myCar.accelerate()
    }
    
    @IBAction func add10Kms(_ sender: UIButton)
    {
        self.myCar.addKms(kmsToAdd: 10)
        self.updateView()
    }
}
