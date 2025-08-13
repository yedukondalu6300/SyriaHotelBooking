
import UIKit
import GoogleSignIn
import AuthenticationServices
class SignInVC: UIViewController {
   
    
//    let yahooClientID = "dj0yJmk9VU1Eek1kU2ZkOXFlJmQ9WVdrOU1qaFJhek5vT0VZbWNHbzlNQT09JnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTY4"
//       let yahooClientSecret = "7e82312a1f55af8260f9c5ae0ff4b2838a6daf83"
//       let yahooRedirectURI = "myapp://auth"
    
    let yahooClientID = "dj0yJmk9VU1Eek1kU2ZkOXFlJmQ9WVdrOU1qaFJhek5vT0VZbWNHbzlNQT09JnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTY4"
      let yahooClientSecret = "7e82312a1f55af8260f9c5ae0ff4b2838a6daf83"
      let yahooRedirectURI = "myapp://callback" // Must match Yahoo console setting
   
    
    
    
    
    
    
    
    
    @IBOutlet weak var aoiImage: NSLayoutConstraint!
    // MARK: - Outlets
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    @IBOutlet weak var IcloudButton: UIButton!
    @IBOutlet weak var microSoftButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var yahooButton: UIButton!
    @IBOutlet weak var aolButton: UIButton!
    @IBOutlet weak var otherEmailButton: UIButton!
    
    @IBOutlet weak var icloudImage: UIImageView!
    @IBOutlet weak var microsoftImage: UIImageView!
    @IBOutlet weak var googleImage: UIImageView!
    @IBOutlet weak var yahooImage: UIImageView!
    @IBOutlet weak var aolImage: UIImageView!
    @IBOutlet weak var otherImage: UIImageView!
    
    // Keep track of selected option
    private var selectedOption: UIButton?
    
    @IBOutlet weak var helpButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // Corner radius for buttons
        [quitButton, continueButton,
         IcloudButton, microSoftButton,
         googleButton, yahooButton,
         aolButton, otherEmailButton].forEach {
            $0?.layer.cornerRadius = 10
        }
        
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.lightGray.cgColor
        continueButton.backgroundColor = .lightGray
        continueButton.isEnabled = false
        
        signInView.layer.cornerRadius = 15
        signInView.layer.borderWidth = 1
        signInView.layer.borderColor = UIColor.black.cgColor
        
        // Shadow
        signInView.layer.shadowColor = UIColor.black.cgColor
        signInView.layer.shadowOpacity = 0.2
        signInView.layer.shadowOffset = CGSize(width: 0, height: 3)
        signInView.layer.shadowRadius = 5
        
        resetAllImages()
    }
    
    // MARK: - Helpers
    private func resetAllImages() {
        let allImages = [icloudImage, microsoftImage, googleImage, yahooImage, aolImage, otherImage]
        allImages.forEach {
            $0?.image = UIImage(systemName: "circle")
            $0?.tintColor = .lightGray
        }
        
        // Deselect all buttons
        [IcloudButton, microSoftButton, googleButton, yahooButton, aolButton, otherEmailButton].forEach {
            $0?.isSelected = false
        }
    }
    
    private func selectOption(button: UIButton, imageView: UIImageView) {
        // Reset all before selecting
        resetAllImages()
        
        // Mark current as selected
        button.isSelected = true
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .systemBlue
        
        selectedOption = button
        
        // Enable continue button
        continueButton.backgroundColor = .systemBlue
        continueButton.isEnabled = true
    }
    
   
    @IBAction func icloudButtonAction(_ sender: UIButton) {
        selectOption(button: sender, imageView: icloudImage)
    }
    
    @IBAction func microSoftButtonAction(_ sender: UIButton) {
        selectOption(button: sender, imageView: microsoftImage)
    }
    
    @IBAction func quitButtonaction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func googleButtonAction(_ sender: UIButton) {
       
        selectOption(button: sender, imageView: googleImage)
        
       
    }

//    @IBAction func yahooButtonAction(_ sender: UIButton) {
//        selectOption(button: sender, imageView: yahooImage)
////        let contrller = self.storyboard?.instantiateViewController(withIdentifier: "YahooVC")as! YahooVC
////        contrller.modalPresentationStyle = .fullScreen
////        self.present(contrller, animated: true)
//        startYahooLogin()
//    }
//    
//    func startYahooLogin() {
//            var comps = URLComponents(string: "https://api.login.yahoo.com/oauth2/request_auth")!
//            comps.queryItems = [
//                URLQueryItem(name: "client_id", value: yahooClientID),
//                URLQueryItem(name: "redirect_uri", value: yahooRedirectURI),
//                URLQueryItem(name: "response_type", value: "code"),
//                URLQueryItem(name: "scope", value: "openid profile email")
//            ]
//            
//            guard let authURL = comps.url else { return }
//            
//            let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: "myapp") { callbackURL, error in
//                if let error = error {
//                    print("Yahoo Login Error:", error.localizedDescription)
//                    return
//                }
//                
//                if let callbackURL = callbackURL {
//                    let queryItems = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false)?.queryItems
//                    if let code = queryItems?.first(where: { $0.name == "code" })?.value {
//                        print("✅ Got Authorization Code:", code)
//                        self.getYahooAccessToken(code: code)
//                    }
//                }
//            }
//            
//            session.presentationContextProvider = self
//            session.start()
//        }
//        
//        // 2️⃣ Get Access Token from Yahoo
//        func getYahooAccessToken(code: String) {
//            let tokenURL = URL(string: "https://api.login.yahoo.com/oauth2/get_token")!
//            var request = URLRequest(url: tokenURL)
//            request.httpMethod = "POST"
//            
//            let params = [
//                "client_id": yahooClientID,
//                "client_secret": yahooClientSecret,
//                "redirect_uri": yahooRedirectURI,
//                "code": code,
//                "grant_type": "authorization_code"
//            ]
//            
//            request.httpBody = params
//                .map { "\($0.key)=\($0.value)" }
//                .joined(separator: "&")
//                .data(using: .utf8)
//            
//            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            
//            URLSession.shared.dataTask(with: request) { data, _, error in
//                if let error = error {
//                    print("Token Error:", error.localizedDescription)
//                    return
//                }
//                guard let data = data else { return }
//                
//                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                    print("Token Response:", json)
//                    if let accessToken = json["access_token"] as? String {
//                        self.getYahooUserProfile(accessToken: accessToken)
//                    }
//                }
//            }.resume()
//        }
//        
//   
//    func getYahooUserProfile(accessToken: String) {
//        let profileURL = URL(string: "https://api.login.yahoo.com/openid/v1/userinfo")!
//        var request = URLRequest(url: profileURL)
//        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//        
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                print("Profile Error:", error.localizedDescription)
//                return
//            }
//            guard let data = data else { return }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                print("Yahoo Profile JSON:", json)
//                
//                if let name = json["name"] as? String {
//                    print("Name:", name)
//                }
//                if let email = json["email"] as? String {
//                    print("Email:", email)
//                }
//                if let picture = json["picture"] as? String {
//                    print("Profile Picture URL:", picture)
//                }
//            }
//        }.resume()
//    }

    @IBAction func yahooButtonAction(_ sender: UIButton) {
        selectOption(button: sender, imageView: yahooImage)
        startYahooLogin()
    }

//    func startYahooLogin() {
//        var comps = URLComponents(string: "https://api.login.yahoo.com/oauth2/request_auth")!
//        comps.queryItems = [
//            URLQueryItem(name: "client_id", value: yahooClientID),
//        //    URLQueryItem(name: "redirect_uri", value: yahooRedirectURI),
//            URLQueryItem(name: "response_type", value: "code"),
//            URLQueryItem(name: "scope", value: "openid profile email")
//        ]
//        
//        guard let authURL = comps.url else { return }
//        
//        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: "myapp") { callbackURL, error in
//            if let error = error {
//                print("Yahoo Login Error:", error.localizedDescription)
//                return
//            }
//            
//            if let callbackURL = callbackURL {
//                let queryItems = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false)?.queryItems
//                if let code = queryItems?.first(where: { $0.name == "code" })?.value {
//                    print("✅ Got Authorization Code:", code)
//                    self.getYahooAccessToken(code: code)
//                }
//            }
//        }
//        
//        session.presentationContextProvider = self
//        session.start()
//    }
//
//    // Step 2: Get Access Token
//    func getYahooAccessToken(code: String) {
//        let tokenURL = URL(string: "https://api.login.yahoo.com/oauth2/get_token")!
//        var request = URLRequest(url: tokenURL)
//        request.httpMethod = "POST"
//        
//        let params = [
//            "client_id": yahooClientID,
//            "client_secret": yahooClientSecret,
//            "redirect_uri": yahooRedirectURI,
//            "code": code,
//            "grant_type": "authorization_code"
//        ]
//        
//        request.httpBody = params
//            .map { "\($0.key)=\($0.value)" }
//            .joined(separator: "&")
//            .data(using: .utf8)
//        
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                print("Token Error:", error.localizedDescription)
//                return
//            }
//            guard let data = data else { return }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                print("Token Response:", json)
//                if let accessToken = json["access_token"] as? String {
//                    self.getYahooUserProfile(accessToken: accessToken)
//                }
//            }
//        }.resume()
//    }
//
//    // Step 3: Get User Profile & Show Credentials
//    func getYahooUserProfile(accessToken: String) {
//        let profileURL = URL(string: "https://api.login.yahoo.com/openid/v1/userinfo")!
//        var request = URLRequest(url: profileURL)
//        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//        
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                print("Profile Error:", error.localizedDescription)
//                return
//            }
//            guard let data = data else { return }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                DispatchQueue.main.async {
//                    let name = json["name"] as? String ?? "N/A"
//                    let email = json["email"] as? String ?? "N/A"
//                    let picture = json["picture"] as? String ?? ""
//                    
//                    print("Yahoo Profile JSON:", json)
//                    print("Name:", name)
//                    print("Email:", email)
//                    print("Profile Picture:", picture)
//                    
//                    // Show in Alert
//                    let alert = UIAlertController(title: "Yahoo Login Success",
//                                                  message: "Name: \(name)\nEmail: \(email)",
//                                                  preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alert, animated: true)
//                }
//            }
//        }.resume()
//    }
//
//    
//    
//    
//    
    @IBAction func aolButtonAction(_ sender: UIButton) {
        selectOption(button: sender, imageView: aolImage)
    }
    
    @IBAction func otherButtonAction(_ sender: UIButton) {
        selectOption(button: sender, imageView: otherImage)
    }
//    
    @IBAction func continueButtonAction(_ sender: Any) {
        guard let selected = selectedOption else { return }
        
        if selected == googleButton {
            let config = GIDConfiguration(clientID: "905963615931-aigg789rk91thimqfr8fm12fbbm4pq9m.apps.googleusercontent.com")
            
            GIDSignIn.sharedInstance.configuration = config
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                if let error = error {
                    print("Google Sign-In error:", error.localizedDescription)
                    return
                }
                
                guard let user = signInResult?.user else { return }
                
                // You can now access user details
                let fullName = user.profile?.name ?? "No name"
                let email = user.profile?.email ?? "No email"
                
                print("✅ Google Sign-In successful!")
                print("Name: \(fullName)")
                print("Email: \(email)")
            }
        } else if selected == IcloudButton {
            print("Navigate to iCloud Sign-In screen")
        } else if selected == microSoftButton {
            print("Navigate to Microsoft Sign-In screen")
        } else if selected == yahooButton {
            print("Navigate to Yahoo Sign-In screen")
        } else if selected == aolButton {
            print("Navigate to AOL Sign-In screen")
        } else if selected == otherEmailButton {
            print("Navigate to Other Email Sign-In screen")
        }
    }
//    
    @IBAction func quitButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
//    
    @IBAction func needButtonaction(_ sender: Any) {
        
        if let url = URL(string: "https://support.apple.com/guide/mac-help/welcome/mac") {
            UIApplication.shared.open(url)
        }

    }
    func startYahooLogin() {
           var comps = URLComponents(string: "https://api.login.yahoo.com/oauth2/request_auth")!
           comps.queryItems = [
               URLQueryItem(name: "client_id", value: yahooClientID),
               URLQueryItem(name: "redirect_uri", value: yahooRedirectURI),
               URLQueryItem(name: "response_type", value: "code"),
               URLQueryItem(name: "scope", value: "openid profile email")
           ]
           
           guard let authURL = comps.url else { return }
           
           let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: "myapp") { callbackURL, error in
               if let error = error {
                   print("Yahoo Login Error:", error.localizedDescription)
                   return
               }
               
               if let callbackURL = callbackURL {
                   let queryItems = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false)?.queryItems
                   if let code = queryItems?.first(where: { $0.name == "code" })?.value {
                       print("✅ Got Authorization Code:", code)
                       self.getYahooAccessToken(code: code)
                   }
               }
           }
           
           session.presentationContextProvider = self
           session.start()
       }
       
       func getYahooAccessToken(code: String) {
           let tokenURL = URL(string: "https://api.login.yahoo.com/oauth2/get_token")!
           var request = URLRequest(url: tokenURL)
           request.httpMethod = "POST"
           
           let params = [
               "client_id": yahooClientID,
               "client_secret": yahooClientSecret,
               "redirect_uri": yahooRedirectURI,
               "code": code,
               "grant_type": "authorization_code"
           ]
           
           request.httpBody = params
               .map { "\($0.key)=\($0.value)" }
               .joined(separator: "&")
               .data(using: .utf8)
           
           request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
           
           URLSession.shared.dataTask(with: request) { data, _, error in
               if let error = error {
                   print("Token Error:", error.localizedDescription)
                   return
               }
               guard let data = data else { return }
               
               if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                   print("Token Response:", json)
                   if let accessToken = json["access_token"] as? String {
                       self.getYahooUserProfile(accessToken: accessToken)
                   }
               }
           }.resume()
       }
       
       func getYahooUserProfile(accessToken: String) {
           let profileURL = URL(string: "https://api.login.yahoo.com/openid/v1/userinfo")!
           var request = URLRequest(url: profileURL)
           request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
           
           URLSession.shared.dataTask(with: request) { data, _, error in
               if let error = error {
                   print("Profile Error:", error.localizedDescription)
                   return
               }
               guard let data = data else { return }
               
               if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                   print("Yahoo Profile JSON:", json)
                   
                   let name = json["name"] as? String ?? "No Name"
                   let email = json["email"] as? String ?? "No Email"
                   let picture = json["picture"] as? String ?? "No Picture"
                   
                   print("Name:", name)
                   print("Email:", email)
                   print("Profile Picture URL:", picture)
               }
           }.resume()
       }
       
    
}
extension SignInVC: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
