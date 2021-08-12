//
//  Cuadrado.swift
//  Tarea
//
//  Created by Francesc Brian Alvis Felix on 10/08/21.
//

import UIKit

protocol CuadradoDelegate {
    func cuadrado(_ cuadrado: Cuadrado, iniciaAnimacionEnFrame frame: CGRect)
    func cuadrado(_ cuadrado: Cuadrado, terminaAnimacionEnFrame frame: CGRect)
}

class Cuadrado : UIView{
    
    private var delegate: CuadradoDelegate
    
    init(frame:CGRect,delegate: CuadradoDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cambiarCentro(){
        
        let sizeSuperview = self.superview?.frame.size ?? .zero
        let posx = CGFloat.random(in: 0...sizeSuperview.width)
        let posy = CGFloat.random(in: 0...sizeSuperview.height)
        
        self.delegate.cuadrado(self, iniciaAnimacionEnFrame: self.frame)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
            self.center = CGPoint(x: posx, y: posy)
        } completion: { _ in
            self.delegate.cuadrado(self, iniciaAnimacionEnFrame: self.frame)
        }

    }
    
}
