//
//  SecondVC.swift
//  Jan-02-Animation
//
//  Created by Admin on 3/1/23.
//

import UIKit

class SecondVC: UIViewController {

    var timer = Timer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute:{ [weak self] in
            self?.rotateImage()
        })
    }
    
    func rotateImage() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 2
        animation.repeatDuration = .infinity
        imageView.layer.add(animation, forKey: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: { [weak self] in
                guard let self = self else {
                    return
                }
                self.imageView.transform = self.imageView.transform.rotated(by: CGFloat.pi/2)
            })
        }
    }
    
}
