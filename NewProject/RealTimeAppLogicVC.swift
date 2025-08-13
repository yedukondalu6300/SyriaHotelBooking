//
//  RealTimeAppLogicVC.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 07/08/25.
//

import UIKit

// MARK: - Model
struct Restaurant {
    let name: String
    let area: String
}

// MARK: - ViewController
class RealTimeAppLogicVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // UI Elements
    let tableView = UITableView()

    // Data
    var allRestaurants: [Restaurant] = []
    var filteredRestaurants: [Restaurant] = []
    var isFiltering = false

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Restaurants"

        setupTableView()
        setupNavigationBar()
        loadRestaurants()
    }

    // MARK: - Setup Table View
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RestCell")
        view.addSubview(tableView)
    }

    // MARK: - Setup Navigation
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetFilter))
    }

    // MARK: - Load Data
    func loadRestaurants() {
        allRestaurants = [
            Restaurant(name: "Biryani Zone", area: "Ameerpet"),
            Restaurant(name: "Paradise", area: "Ameerpet"),
            Restaurant(name: "Taj Hotel", area: "Banjara Hills"),
            Restaurant(name: "Shah Ghouse", area: "Mehdipatnam"),
            Restaurant(name: "Hotel Sitara", area: "Banjara Hills"),
            Restaurant(name: "Spicy House", area: "Mehdipatnam"),
            Restaurant(name: "Zaiqa", area: "Banjara Hills"),
            Restaurant(name: "Tandoori Nights", area: "Ameerpet")
        ]
    }

    // MARK: - Reset Filter
    @objc func resetFilter() {
        isFiltering = false
        filteredRestaurants = []
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredRestaurants.count : allRestaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = isFiltering ? filteredRestaurants[indexPath.row] : allRestaurants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestCell", for: indexPath)
        cell.textLabel?.text = "\(restaurant.name) (\(restaurant.area))"
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = isFiltering ? filteredRestaurants[indexPath.row] : allRestaurants[indexPath.row]
        let selectedArea = selected.area

        filteredRestaurants = allRestaurants.filter { $0.area == selectedArea }
        isFiltering = true
        tableView.reloadData()
    }
}
