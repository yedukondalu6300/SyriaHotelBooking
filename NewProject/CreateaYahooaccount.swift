//
//  CreateaYahooaccount.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 12/08/25.
//

import UIKit

class CreateaYahooaccount: UIViewController {

    @IBOutlet weak var myEmailButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Button()
    }
    
    func Button(){
        nextButton.layer.cornerRadius = 10
        googleButton.layer.cornerRadius = 10
        myEmailButton.layer.cornerRadius = 10
        
    }
  

}
