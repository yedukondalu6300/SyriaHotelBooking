//
//  ContactUSVC.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 11/08/25.
//

import UIKit

class ContactUSVC: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var designView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 15
        designView.layer.cornerRadius = 15
        uiView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueButtonAction(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "SignInVC")as! SignInVC
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
