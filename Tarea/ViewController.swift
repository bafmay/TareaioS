//
//  ViewController.swift
//  Tarea
//
//  Created by Francesc Brian Alvis Felix on 4/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapVerMas(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.isVerMasPressed = !self.isVerMasPressed
            self.labelText.numberOfLines = self.isVerMasPressed ? 0 : 2
            self.btnVerMas.setTitle(self.isVerMasPressed ? "Ver menos" : "Ver más", for: .normal)
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBOutlet weak var cnsBottomScroll: NSLayoutConstraint!
    
    @IBOutlet weak var btnVerMas: UIButton!
    var isVerMasPressed = false
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }

    
    
}

//MARK: - keyboard observer
//MARK: -
extension ViewController{
    func registerKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterKeyboardEvents(){
        //ELIMINA TODO LOS OBSERVERS
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification : Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        UIView.animate(withDuration: animationDuration) {
            self.cnsBottomScroll.constant = keyboardFrame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification : Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration) {
            self.cnsBottomScroll.constant = 16
            self.view.layoutIfNeeded()
        }
    }
    
}

