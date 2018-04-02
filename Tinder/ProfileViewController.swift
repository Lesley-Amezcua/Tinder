//
//  ProfileViewController.swift
//  Tinder
//
//  Created by lesley amezcua on 3/29/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var doneImage: UIImageView!
    var profileImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImage
        // Do any additional setup after loading the view.
    }

    @IBAction func doneTap(_ sender: Any) {
        dismiss(animated: true){
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
