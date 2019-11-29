//
//  ViewController.swift
//  testTranslateRotate
//
//  Created by kaww on 29/11/2019.
//  Copyright © 2019 KAWRANTIN LE GOFF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animateButton: UIButton!
    
    var bodyView: UIView!
    var contentView: UIView!
    
    var hasMoved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        animateButton.layer.cornerRadius = 10
        
        bodyView = UIView(frame: CGRect(x: view.frame.width / 2 - 125, y: view.frame.height / 2 - 125, width: 250, height: 250))
        
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        contentView.backgroundColor = .red
        contentView.center = CGPoint(x: 125, y: 125)
        contentView.layer.cornerRadius = 10
        
        bodyView.addSubview(contentView)
        
        view.addSubview(bodyView)
        
        animate(UIButton())
        
    }

    @IBAction func animate(_ sender: UIButton) {
        
        if hasMoved {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction], animations: {
                self.bodyView.transform = .identity
                
                self.contentView.transform = .identity
                self.contentView.backgroundColor = .red
                self.contentView.layer.cornerRadius = 10
                
                self.animateButton.layer.cornerRadius = 10
                self.animateButton.backgroundColor = .red
            })
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction], animations: {
                var tBody = CGAffineTransform.identity
                tBody = tBody.translatedBy(x: 0, y: -200)
                tBody = tBody.scaledBy(x: 0.05, y: 0.05)
                self.bodyView.transform = tBody
                
                var tContent = CGAffineTransform.identity
                tContent = tContent.rotated(by: .pi)
                self.contentView.transform = tContent
                self.contentView.backgroundColor = .systemBlue
                self.contentView.layer.cornerRadius = 125
                
                self.animateButton.layer.cornerRadius = self.animateButton.frame.height / 2
                self.animateButton.backgroundColor = .systemBlue
            })
        }
        
        hasMoved.toggle()
    }
    
}

