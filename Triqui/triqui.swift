//
//  ViewController.swift
//  Triqui
//  versión final
//  Created by Ricardo arango on 9/09/15.
//  Copyright (c) 2015 Ideas App Colombia. All rights reserved.
//

import UIKit

class triqui: UIViewController {
    
    var jugador_activo = 1
    
    var cont_circulos = 0
    
    var cont_equis = 0
    
    var juego_activo = true
    
    var estado_juego = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var combinaciones = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    
    
    @IBOutlet weak var contador_circulo: UILabel!
    
    @IBOutlet weak var contador_equis: UILabel!
    
    @IBOutlet weak var cuadrante1: UIButton!
    
    @IBOutlet weak var ganador: UILabel!
    
    @IBOutlet weak var reiniciar: UIButton!
    
    @IBAction func reiniciar_boton(sender: AnyObject) {
       
        jugador_activo = 1
        
        juego_activo = true
        
        estado_juego = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        ganador.text = " "
        
        var cuadrante1 : UIButton
        
        for var i = 1; i < 10; i++ {
            cuadrante1 = view.viewWithTag(i) as! UIButton
            cuadrante1.setImage(nil, forState: .Normal)
        }
    }
    
    @IBAction func cuadrante1(sender: AnyObject) {
        
        if estado_juego[sender.tag] == 0 && juego_activo == true {
            
            var imagen = UIImage()
            
            estado_juego[sender.tag] = jugador_activo
            
            if jugador_activo == 1{
                
                imagen = UIImage (named: "equis.png")!
                
                jugador_activo = 2
                
            }
            else
            {
                imagen = UIImage (named: "circulo.png")!
                
                jugador_activo = 1
                
            }
            
            sender.setImage(imagen, forState: .Normal)
            
            for combinacion in combinaciones{
                if estado_juego[combinacion[0]] != 0 && estado_juego[combinacion[0]] == estado_juego[combinacion[1]] && estado_juego[combinacion[1]] == estado_juego[combinacion[2]]{
                    
                    if estado_juego[combinacion[0]] == 1{
                        
                        ganador.text = "El jugador 1 es el ganador"
                        cont_circulos++
                        contador_circulo.text = String(cont_circulos)
                        
                    }
                    else{
                        
                        ganador.text = "El jugador 2 es el ganador"
                        cont_equis++
                        contador_equis.text = String(cont_equis)
                        
                    }
                    juego_activo = false
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

