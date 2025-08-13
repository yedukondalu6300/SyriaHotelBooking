//
//  PrivacyAndCookies.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 07/08/25.
//
import UIKit

class PrivacyAndCookies: UIViewController {

    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Privacy & Cookies"
        view.backgroundColor = .systemBackground
        setupViews()
        setupContent()
    }

    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        contentStackView.axis = .vertical
        contentStackView.spacing = 12
        contentStackView.alignment = .leading

        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupContent() {
        addTitle("Privacy Policy")
        addSubTitle("Last update: Mar 17, 2025")
        
        addBody("""
At SyriaBooking.sy, we respect your privacy and are committed to protecting your personal data. This Privacy & Cookie Statement explains how we collect, use, store, and protect your personal information, and how we use cookies when you visit or use our website.
""")

        addSectionTitle("1. What Information We Collect:")
        addSubSection("a. Personal Data", items: [
            "Full name",
            "Email address",
            "Phone number",
            "Booking preferences (hotel name, city, travel dates)",
            "Special requests, if any"
        ])
        addSubSection("b. Technical Data", items: [
            "IP address",
            "Browser type and version",
            "Device type",
            "Location (if permitted by browser/device settings)",
            "Pages visited and interaction behavior"
        ])
        addBody("We do not collect credit card or payment information, as all payments are made directly at the hotel.")

        addSectionTitle("2. How We Use Your Information:")
        addBulletPoints([
            "Process and confirm your hotel bookings",
            "Send booking confirmations and updates via email/SMS",
            "Improve user experience and optimize our website performance",
            "Respond to customer service requests or support issues",
            "Prevent fraud or misuse of our platform",
            "Send service updates or offers (only with your consent)"
        ])

        addSectionTitle("3. How We Share Your Information:")
        addBulletPoints([
            "The hotel you have booked with (for reservation purposes only)",
            "Our internal customer support and tech teams",
            "Legal authorities when required by law or regulation"
        ])

        addSectionTitle("4. Data Security:")
        addBulletPoints([
            "Encrypted connection (HTTPS)",
            "Secure database storage",
            "Limited access to authorized personnel only"
        ])

        addSectionTitle("5. Data Retention:")
        addBody("""
We retain your personal data only as long as needed to fulfill your bookings or comply with legal obligations. You may request deletion of your data at any time by contacting us at info@syriabooking.sy.
""")

        addSectionTitle("6. Cookie Policy:")
        addSubSection("a. What Are Cookies?", items: [
            "Cookies are small text files stored on your device when you visit a website. They help us understand your preferences and improve your experience."
        ])
        addSubSection("b. Types of Cookies We Use", items: [
            "Essential Cookies: Enable core functionality like booking and login",
            "Performance Cookies: Help us understand user behavior and improve performance",
            "Functionality Cookies: Remember your settings and preferences",
            "Analytics Cookies: Track usage to help us improve content and layout"
        ])
        addSubSection("c. Managing Cookies", items: [
            "You can manage or disable cookies via your browser settings. However, some parts of our website may not work properly without cookies."
        ])

        addSectionTitle("7. International Users:")
        addBody("""
SyriaBooking.sy is based in Syria. By using our platform, you agree that your personal data will be processed and stored within Syria or in other countries where our systems operate.
""")

        addSectionTitle("8. Your Rights:")
        addBulletPoints([
            "Access your personal data",
            "Request correction of inaccurate data",
            "Request deletion of your data (where applicable)",
            "Withdraw your consent for marketing communication",
            "Lodge a complaint with a data protection authority (if applicable)"
        ])

        addSectionTitle("9. Contact Us:")
        addBody("""
For questions, requests, or concerns related to privacy or cookies, please contact:

Email: info@syriabooking.sy  
Phone: +963-123-456789
""")

        addBody("""
Thank you for visiting!  
By using our website or services, you consent to the terms of this Privacy Policy. Please review this policy periodically for updates or changes.
""")
    }

    // MARK: - Helper Functions for UI

    private func addTitle(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        label.numberOfLines = 0
        contentStackView.addArrangedSubview(label)
    }

    private func addSubTitle(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        contentStackView.addArrangedSubview(label)
    }

    private func addSectionTitle(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        contentStackView.addArrangedSubview(label)
    }

    private func addBody(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        contentStackView.addArrangedSubview(label)
    }

    private func addBulletPoints(_ items: [String]) {
        for item in items {
            let label = UILabel()
            label.text = "• \(item)"
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .label
            label.numberOfLines = 0
            contentStackView.addArrangedSubview(label)
        }
    }

    private func addSubSection(_ title: String, items: [String]) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        contentStackView.addArrangedSubview(titleLabel)

        addBulletPoints(items)
    }
}
