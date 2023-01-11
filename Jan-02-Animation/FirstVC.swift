//
//  ViewController.swift
//  Jan-02-Animation
//
//  Created by Admin on 2/1/23.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        alertViewTopConstraint.constant -= alertView.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alertViewTopConstraint.constant = 150
        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseInOut], animations: { [weak self] in
            self?.alertView.backgroundColor = .red
            self?.view.layoutIfNeeded()
        })
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.repeat],
                       animations: { [weak self] in
            self?.alertView.backgroundColor = .magenta
            self?.alertView.bounds.size.height *= 0.5
            self?.alertView.bounds.size.width *= 0.5
        }, completion: { [weak self] _ in
            self?.alertView.layer.cornerRadius = 30
        })
    }
    
}

