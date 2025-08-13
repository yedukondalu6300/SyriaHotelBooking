//
//  LogicVC.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 07/08/25.
//

import UIKit

struct User {
    let name: String
    let age: Int
}

class LogicVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    // MARK: - UI Elements
    let tableView = UITableView()
    let searchBar = UISearchBar()

    // MARK: - Data
    let allUsers: [User] = [
        User(name: "Mahesh", age: 25),
        User(name: "Kondalu", age: 30),
        User(name: "Ravi", age: 28),
        User(name: "Mahendra", age: 35),
        User(name: "Karthik", age: 22),
        User(name: "Pavan", age: 27)
    ]

    var filteredUsers: [User] = []
    var isFiltering: Bool = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Setup UI
    func setupUI() {
        view.backgroundColor = .white

        // Setup search bar
        searchBar.delegate = self
        searchBar.placeholder = "Search users..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        // Setup table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Constraints
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredUsers.count : allUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = isFiltering ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        cell.textLabel?.text = "\(user.name) - Age: \(user.age)"
        return cell
    }

    // MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
            filteredUsers = []
        } else {
            isFiltering = true
            filteredUsers = allUsers.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}
