//
//  ThirdVC.swift
//  Jan-02-Animation
//
//  Created by Admin on 3/1/23.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var sandtimerView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var topViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitBtnLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .curveEaseOut, .autoreverse], animations: { [weak self] in
            guard let self = self else {
                return
            }
            self.sandtimerView.bounds.size.width *= 0.5
            self.sandtimerView.bounds.size.height *= 0.5
            self.sandtimerView.transform = self.sandtimerView.transform.rotated(by: 179)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //topViewLeadingConstraint.constant = topView.frame.width
        submitBtnLeadingConstraint.constant = (submitBtnLeadingConstraint.constant * 2) + btnView.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: {
            [weak self] in
            self?.submitBtnLeadingConstraint.constant = 30
            self?.view.layoutIfNeeded()
        })
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        guard validateEmail() else {
            shakeField(field: emailField)
            return
        }
        guard validatePassword() else {
            shakeField(field: passwordField)
            return
        }
        print("login successful!!")
    }
    
    func shakeField(field: UITextField) {
        // from chatGPT
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: field.center.x - 10, y: field.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: field.center.x + 10, y: field.center.y))
        field.layer.add(animation, forKey: "position")
        
        
        // own try
//        UIView.animate(withDuration: 0.07, delay: 0, options: [.autoreverse],
//                       animations: {
//
//        }, completion: { _ in
//
//        })
    }
    
    func validateEmail() -> Bool {
        guard let val = emailField.text else {
            return false
        }
        let regExp = "[A-z0-9a-z._%+-]+@[a-zA-Z0-9]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", regExp)
        return emailPred.evaluate(with: val)
    }
    
    func validatePassword() -> Bool {
        guard let pass = passwordField.text else {
            return false
        }
        return pass.count >= 8
    }
}
