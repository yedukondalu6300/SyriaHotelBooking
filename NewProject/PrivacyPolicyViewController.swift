//
//  PrivacyPolicyViewController.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 07/08/25.
//

//import UIKit
//
//class PrivacyPolicyViewController: UIViewController {
//    
//    private let privacyTextView: UITextView = {
//        let textView = UITextView()
//        textView.isEditable = false
//        textView.isSelectable = true
//        textView.isScrollEnabled = true
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.font = UIFont.systemFont(ofSize: 16)
//        textView.textColor = .label
//        textView.backgroundColor = .systemBackground
//        return textView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        loadPrivacyPolicy()
//    }
//
//    private func setupUI() {
//        title = "Privacy Policy"
//        view.backgroundColor = .systemBackground
//        view.addSubview(privacyTextView)
//
//        NSLayoutConstraint.activate([
//            privacyTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            privacyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            privacyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            privacyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    private func loadPrivacyPolicy() {
//        privacyTextView.text = """
//Privacy Policy
//
//Welcome to SyriaBooking.sy
//
//Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your personal data when you use our website.
//
//1. Data Collection:
//We collect minimal personal data required for booking and customer support purposes. This may include:
//- Name
//- Contact details (email, phone)
//- Booking history
//
//2. Data Usage:
//We use your data to:
//- Process bookings and confirmations
//- Communicate regarding reservations
//- Improve user experience on our platform
//
//3. Data Sharing:
//We do not sell or rent your data. Your booking details are shared only with the selected hotel to confirm the reservation.
//
//4. Cookies:
//Our platform may use cookies to enhance your browsing experience and gather analytics.
//
//5. Data Security:
//We implement appropriate security measures to protect your information against unauthorized access.
//
//6. Your Rights:
//You can request to:
//- Access the data we store about you
//- Update or correct your data
//- Delete your account and associated data
//
//7. Policy Updates:
//We may update this policy periodically. Please check back occasionally to stay informed.
//
//8. Contact:
//For privacy-related questions, contact us at:
//Email: info@syriabooking.sy
//Phone: +963-123-456789
//
//By using our services, you agree to the terms of this Privacy Policy.
//"""
//    }
//}
import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController {

    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Terms & Conditions"
        view.backgroundColor = .white

        webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)

        loadHTMLContent()
    }

    private func loadHTMLContent() {
        let htmlString = """
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body { font-family: -apple-system; padding: 20px; color: #333333; }
                h2, h5, h6 { color: #000000; }
                ul { padding-left: 20px; }
                li { margin-bottom: 8px; }
                a { color: #007BFF; text-decoration: none; }
            </style>
        </head>
        <body>
            <h2>Terms & Conditions</h2>
            <p>Welcome to SyriaBooking.sy</p>

            <p>These Terms & Conditions (“Terms”) govern your use of the SyriaBooking.sy website and services...</p>

            <h5>1. Definitions:</h5>
            <ul>
                <li><strong>“Platform”</strong> refers to SyriaBooking.sy website and related services.</li>
                <li><strong>“User”, “You”</strong> refers to any person browsing, using, or booking through SyriaBooking.sy.</li>
                <li><strong>“Hotel” or “Property”</strong> means the accommodation provider listed on the platform.</li>
                <li><strong>“Booking”</strong> means a reservation made through SyriaBooking.sy for accommodation.</li>
            </ul>

            <h5>2. Scope of Our Services:</h5>
            <p>SyriaBooking.sy provides an online platform for users to browse, compare, and reserve accommodations in Syria...</p>

            <h5>3. Booking Policy:</h5>
            <ul>
                <li>You may book rooms through the website without any prepayment.</li>
                <li>Your booking confirmation is sent via email or SMS after successful reservation.</li>
                <li>Payment is made directly to the hotel at check-in, in cash or as per the hotel’s accepted payment methods.</li>
                <li>Some hotels may request a follow-up confirmation via phone or message; failure to confirm may result in cancellation.</li>
            </ul>

            <!-- You can continue adding the rest of the HTML content from your post here -->

            <h6>Thank you for visiting!</h6>
            <p>By using our website or services, you consent to the terms of this Privacy Policy. Please review this policy periodically for updates or changes.</p>

            <p><strong>Contact:</strong> <a href="mailto:info@syriabooking.sy">info@syriabooking.sy</a></p>
        </body>
        </html>
        """

        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
