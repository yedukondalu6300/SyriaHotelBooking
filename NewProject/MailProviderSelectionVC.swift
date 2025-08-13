//import UIKit
//
//class MailProviderSelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    let containerView = UIView()
//    let titleLabel = UILabel()
//    let tableView = UITableView()
//    let quitButton = UIButton(type: .system)
//    let continueButton = UIButton(type: .system)
//    
//    let providers = [
//        "iCloud", "Microsoft Exchange", "Google",
//        "yahoo!", "Aol.", "Other Mail Account…"
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupBackground()
//        setupContainer()
//        setupUI()
//    }
//    
//    private func setupBackground() {
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//    }
//    
//    private func setupContainer() {
//        containerView.backgroundColor = .darkGray
//        containerView.layer.cornerRadius = 12
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(containerView)
//        
//        NSLayoutConstraint.activate([
//            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: 320),
//            containerView.heightAnchor.constraint(equalToConstant: 420)
//        ])
//    }
//    
//    private func setupUI() {
//        // Title
//        titleLabel.text = "Choose a Mail account provider…"
//        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//        titleLabel.textColor = .white
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(titleLabel)
//        
//        // TableView
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.isScrollEnabled = false
//        tableView.backgroundColor = .darkGray
//        tableView.separatorStyle = .none
//        containerView.addSubview(tableView)
//        
//        // Buttons
//        quitButton.setTitle("Quit", for: .normal)
//        quitButton.setTitleColor(.white, for: .normal)
//        quitButton.addTarget(self, action: #selector(dismissPopup), for: .touchUpInside)
//        quitButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        continueButton.setTitle("Continue", for: .normal)
//        continueButton.setTitleColor(.gray, for: .normal)
//        continueButton.isEnabled = false
//        continueButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        containerView.addSubview(quitButton)
//        containerView.addSubview(continueButton)
//        
//        // Layout constraints
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
//            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            
//            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
//            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            tableView.heightAnchor.constraint(equalToConstant: 250),
//            
//            quitButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
//            quitButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
//            quitButton.widthAnchor.constraint(equalToConstant: 100),
//            quitButton.heightAnchor.constraint(equalToConstant: 36),
//            
//            continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
//            continueButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
//            continueButton.widthAnchor.constraint(equalToConstant: 100),
//            continueButton.heightAnchor.constraint(equalToConstant: 36)
//        ])
//    }
//
//    // MARK: - Table View
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return providers.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = providers[indexPath.row]
//        cell.textLabel?.textColor = .white
//        cell.backgroundColor = .darkGray
//        cell.selectionStyle = .none
//        return cell
//    }
//
//    // MARK: - Dismiss
//    @objc func dismissPopup() {
//        dismiss(animated: true, completion: nil)
//    }
//}
import UIKit

class MailProviderSelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let containerView = UIView()
    let titleLabel = UILabel()
    let tableView = UITableView()
    let quitButton = UIButton(type: .system)
    let continueButton = UIButton(type: .system)
    
    var selectedIndex: Int?

    struct MailProvider {
        let name: String
        let iconName: String // SF Symbol or asset name
    }

    let providers: [MailProvider] = [
        .init(name: "iCloud", iconName: "icloud"),
        .init(name: "Microsoft Exchange", iconName: "envelope"),
        .init(name: "Google", iconName: "g.circle.fill"),
        .init(name: "yahoo!", iconName: "y.circle.fill"),
        .init(name: "Aol.", iconName: "a.circle.fill"),
        .init(name: "Other Mail Account…", iconName: "ellipsis.circle")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupContainer()
        setupUI()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    private func setupContainer() {
        containerView.backgroundColor = .darkGray
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 330),
            containerView.heightAnchor.constraint(equalToConstant: 430)
        ])
    }
    
    private func setupUI() {
        // Title
        titleLabel.text = "Choose a Mail account provider…"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MailOptionCell.self, forCellReuseIdentifier: "MailOptionCell")
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        containerView.addSubview(tableView)
        
        // Buttons
        styleButton(quitButton, title: "Quit", color: .lightGray)
        quitButton.addTarget(self, action: #selector(dismissPopup), for: .touchUpInside)
        
        styleButton(continueButton, title: "Continue", color: .gray)
        continueButton.isEnabled = false
        
        containerView.addSubview(quitButton)
        containerView.addSubview(continueButton)
        
        // Layout
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 260),
            
            quitButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            quitButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            quitButton.widthAnchor.constraint(equalToConstant: 100),
            quitButton.heightAnchor.constraint(equalToConstant: 40),
            
            continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            continueButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            continueButton.widthAnchor.constraint(equalToConstant: 100),
            continueButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func styleButton(_ button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let provider = providers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MailOptionCell", for: indexPath) as! MailOptionCell
        cell.configure(with: provider.name, iconName: provider.iconName, isSelected: indexPath.row == selectedIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        continueButton.isEnabled = true
        continueButton.backgroundColor = .systemBlue
        tableView.reloadData()
    }
    
    @objc func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }
}
import UIKit

class MailOptionCell: UITableViewCell {
    
    let iconView = UIImageView()
    let titleLabel = UILabel()
    let radioButton = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        backgroundColor = .clear

        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.tintColor = .white
        contentView.addSubview(iconView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(titleLabel)

        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.tintColor = .white
        contentView.addSubview(radioButton)

        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 24),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            radioButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            radioButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            radioButton.widthAnchor.constraint(equalToConstant: 20),
            radioButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with title: String, iconName: String, isSelected: Bool) {
        titleLabel.text = title
        iconView.image = UIImage(systemName: iconName)
        radioButton.image = UIImage(systemName: isSelected ? "largecircle.fill.circle" : "circle")
    }
}
