//
//  ViewController.swift
//  CardViewCustom
//
//  Created by Alejandro Ariza on 10/19/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //para expandir y contraer la tarjeta, se guardar los estados.
     enum CardState {
            case expanded
            case collapsed
        }
    
    var cardViewController:CardViewController! //instancia del viewController.
    var efectoVisual:UIVisualEffectView! //efecto visual para mostrar la tarjeta con enfoque o desenfoque.

    //Constantes para determinar la altura de la tarjeta a mostrar en el View Principal.
    let cardHeight:CGFloat = 600 //altura de la tarjeta
    let cardHandleAreaHeight:CGFloat = 65 //altura de la opción para el SwipeUP
    
    var cardVisible = false //estado para identificar si la tarjeta es visible o no.
    
    //con esta propiedad se determina el futuro estado de la tarjeta.
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    //Animaciones
    var runningAnimations = [UIViewPropertyAnimator]() //matrix que contiene las animaciones de la tarjeta.
    var animationProgressWhenInterrupted:CGFloat = 0 //interrupción de la animación.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
    
    
    func setupCard() {
        
        //Se agrega el efecto Buller.
        efectoVisual = UIVisualEffectView() //instanciar los efectos.
        efectoVisual.frame = self.view.frame //establecer el marco actual o efectos en la vista principal.
        self.view.addSubview(efectoVisual) //agregar el efecto en la vista principal.
        
        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil) //se inicializa la vista a mostrar "CardViewController.xib"
        
        self.addChild(cardViewController) //Se agrega el menu o sub vista "CardViewController.xib" a la vista principal.
        self.view.addSubview(cardViewController.view)
        
        
        //enmarca la vista "CardViewController.xib" en la vista principal
        cardViewController.view.frame = CGRect(x: 0,
                                               y: self.view.frame.height - cardHandleAreaHeight, //Se ubica en la parte inferior y se deja mostrando el header de la vista o tarjeta.
                                               width: self.view.bounds.width, //Ancho
                                               height: cardHeight)//altura de la tarjeta
        
        cardViewController.view.clipsToBounds = true //rebote de la vista.
        
        
        
    }
    


}

