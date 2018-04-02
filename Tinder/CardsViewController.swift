//
//  ViewController.swift
//  Tinder
//
//  Created by lesley amezcua on 3/29/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    var cardOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xFromCenter = cardImageView.center.x - view.center.x
        
        if sender.state == .began {
            cardOriginalCenter = cardImageView.center
            print("Gesture began")
        } else if sender.state == .changed {
            cardImageView.center = CGPoint(x: cardOriginalCenter.x + translation.x, y: cardOriginalCenter.y )
            if xFromCenter > 0 {
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(xFromCenter) * Double.pi / 360))
            }else{
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(xFromCenter) * Double.pi / 360))
            }
            print(cardImageView.center.x)
            print("Gesture is changing")
        } else if sender.state == .ended {
            
            if cardImageView.center.x < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardImageView.center.x - 200, y: self.cardImageView.center.y + 75)
                    self.cardImageView.alpha = 0
                })
            } else if cardImageView.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardImageView.center.x + 200, y: self.cardImageView.center.y + 75)
                    self.cardImageView.alpha = 0
                })
            }
            print("Gesture ended")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            print("image")
            let profileViewImage = segue.destination as! ProfileViewController
            profileViewImage.profileImage = cardImageView.image
        }
    }
    
    @IBAction func onpictureTap(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: sender)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

