//
//  Opcion1ViewController.swift
//  Tarea
//
//  Created by Francesc Brian Alvis Felix on 8/08/21.
//

import UIKit

class Opcion1ViewController : UIViewController{
    
    @IBAction func tapSquare(_ sender: Any) {
        cambiarCentro()
    }
    
    @IBOutlet weak var square: UIView!
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func cambiarCentro(){
        
        let sizeSuperview = square.superview?.frame.size ?? .zero
        let posx = CGFloat.random(in: 0...sizeSuperview.width)
        let posy = CGFloat.random(in: 0...sizeSuperview.height)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
            self.square.center = CGPoint(x: posx, y: posy)
        } completion: { _ in
            
        }
    }
    
}


