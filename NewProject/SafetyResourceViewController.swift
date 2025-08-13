//
//  SafetyResourceViewController.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 07/08/25.
//

import UIKit

class SafetyResourceViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContent()
    }
    
    func setupView() {
        view.backgroundColor = .white
        title = "Safety Resource Center"
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.alignment = .leading
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    func setupContent() {
        addTitle("Your Safety Is Our Priority", color: .systemRed)
        addBody("At SyriaBooking.sy, your peace of mind is at the heart of everything we do. We are committed to providing a safe, secure, and informed travel experience — from the moment you book until you check out.")

        addSectionHeader("1. Booking Safety & Privacy")
        addBulletPoints([
            "✅ Verified Hotels Only: All listed properties go through a strict verification process.",
            "🔐 Secure Platform: Your data is protected with encryption and privacy protocols.",
            "💵 No Advance Payment Required: Book now, pay on arrival — no card needed."
        ])
        
        addSectionHeader("2. Hotel Safety Measures")
        addBulletPoints([
            "🧼 Daily room cleaning and sanitization.",
            "🩹 First aid kits available onsite.",
            "📞 Emergency contact info easily accessible.",
            "👨‍⚕️ Trained staff for emergencies.",
            "🧽 Hygiene protocols for high-contact areas.",
            "🛡️ Look for the “Safety Certified” badge on verified hotels."
        ])
        
        addSectionHeader("3. Traveler Responsibility")
        addBulletPoints([
            "📜 Follow local safety and travel regulations.",
            "🛎️ Respect hotel rules and staff guidance.",
            "🆔 Carry valid ID and documents.",
            "📱 Save emergency numbers on your phone."
        ])
        
        addSectionHeader("4. In Case of Emergency")
        addBody("Local Police: 112\nMedical Emergency: 110\nEmail: info@syriabooking.sy\nPhone: +963-123-456789")

        addSectionHeader("5. Travel Tips for Syria")
        addBulletPoints([
            "📍 Stick to known hotel areas.",
            "🌙 Avoid late-night travel in unfamiliar places.",
            "🔒 Use hotel safes for valuables.",
            "📤 Share your travel itinerary with loved ones."
        ])
        
        addTitle("Need Help?", color: .systemGreen)
        addBody("If you have any concerns before, during, or after your stay, our customer care team is here to support you. We’re available 24/7 to ensure your safety and satisfaction.")
    }
    
    // MARK: - Helper Methods
    
    func addTitle(_ text: String, color: UIColor) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = color
        label.numberOfLines = 0
        contentStack.addArrangedSubview(label)
    }

    func addSectionHeader(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        contentStack.addArrangedSubview(label)
    }

    func addBody(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        contentStack.addArrangedSubview(label)
    }
    
    func addBulletPoints(_ items: [String]) {
        for item in items {
            let label = UILabel()
            label.text = "• " + item
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .black
            label.numberOfLines = 0
            contentStack.addArrangedSubview(label)
        }
    }
}
