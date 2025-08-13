//
//  YahooVC.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 11/08/25.
//

import UIKit
import GoogleSignIn
class YahooVC: UIViewController {
    @IBOutlet weak var createaccountButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = CGColor(red: 48/245, green: 47/245, blue:208/245,alpha: 1)
        createaccountButton.layer.cornerRadius = 10
        createaccountButton.layer.borderWidth = 1
        createaccountButton.layer.borderColor = UIColor.lightGray.cgColor
        
        signInButton.layer.cornerRadius = 10
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = CGColor(red: 48/245, green: 47/245, blue:208/245,alpha: 1)
    }
    @IBAction func NextButton(_ sender: Any) {
  
        
        
let config = GIDConfiguration(clientID: "905963615931-aigg789rk91thimqfr8fm12fbbm4pq9m.apps.googleusercontent.com")

        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            if let error = error {
                print("Google Sign-In error:", error.localizedDescription)
                return
            }
            
            guard let user = signInResult?.user else { return }
            
            let fullName = user.profile?.name ?? "No name"
            let email = user.profile?.email ?? "No email"
            let profilePicURL = user.profile?.imageURL(withDimension: 200) // 200px image size
            
            print("✅ Google Sign-In successful!")
            print("Name: \(fullName)")
            print("Email: \(email)")
            if let url = profilePicURL {
                print("Profile Picture URL: \(url.absoluteString)")
            }
        }

        
    }
 

    @IBAction func forgotButtonCtion(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "ForgotVC")as!  ForgotVC
        controller.modalPresentationStyle = .formSheet
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
/*
 123

 G: 58

 B: 255
 */
