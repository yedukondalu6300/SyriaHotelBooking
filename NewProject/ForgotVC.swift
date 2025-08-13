//
//  ForgotVC.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 12/08/25.
//

//import UIKit
//
//class ForgotVC: UIViewController {
//    @IBOutlet weak var continueButton: UIButton!
//    
//    @IBOutlet weak var username: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        buttonSetup()
//    }
//    func buttonSetup(){
//        continueButton.layer.cornerRadius = 15
//    }
//    @IBAction func continueButtonAction(_ sender: Any) {
//    }
//    
//   
//}
import UIKit

class ForgotVC: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
    }
    
    func buttonSetup(){
        continueButton.layer.cornerRadius = 15
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        guard let enteredUsername = username.text, !enteredUsername.isEmpty else {
            showAlert(message: "Please enter your username or email.")
            return
        }
        
        // Navigate to VerificationCodeVC
        if let verificationVC = storyboard?.instantiateViewController(withIdentifier: "VerificationCodeVC") as? VerificationCodeVC {
            verificationVC.modalPresentationStyle = .fullScreen
            present(verificationVC, animated: true)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
