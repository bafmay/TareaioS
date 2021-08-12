//
//  Opcion2ViewController.swift
//  Tarea
//
//  Created by Francesc Brian Alvis Felix on 10/08/21.
//

import UIKit

class Opcion2ViewController: UIViewController{
    
    @IBAction func tapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var square: UIView!
    
    @IBAction func tapSquare(_ sender: Any) {
        cambiarCentro()
        cambiarColor()
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
    
    func cambiarColor(){
        let r = CGFloat.random(in: 0...255) / 255
        let g = CGFloat.random(in: 0...255) / 255
        let b = CGFloat.random(in: 0...255) / 255
        
        square.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    }
}
