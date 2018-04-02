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
        let translate = sender.translation(in: view)
        
        if sender.state == .began{
            cardOriginalCenter = self.cardImageView.center
        }
            
        else if sender.state == .changed{
            self.cardImageView.center = CGPoint(x: cardOriginalCenter.x + translate.x, y: cardOriginalCenter.y + translate.y)
            self.cardImageView.transform = CGAffineTransform(rotationAngle: translate.x / 20 * (CGFloat.pi / 180.0))
            print("Translate x: \(translate.x)")
        }
            
        else if sender.state == .ended{
            
            if(translate.x > 100){
                UIView.animate(withDuration: 0.25, animations: {
                    self.cardImageView.transform = self.cardImageView.transform.translatedBy(x: 400, y: 0)
                }, completion: { (done) in
                    self.cardImageView.removeFromSuperview()
                })
            }
            else if(translate.x < -100){
                UIView.animate(withDuration: 0.25, animations: {
                    self.cardImageView.transform = self.cardImageView.transform.translatedBy(x: -400, y: 0)
                }, completion: { (done) in
                    self.cardImageView.removeFromSuperview()
                })
            }
                
            else{
                UIView.animate(withDuration: 0.4, animations: {
                    self.cardImageView.center = self.cardOriginalCenter
                    self.cardImageView.transform = CGAffineTransform.identity
                }, completion: { (done) in
                    
                })
            }
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

