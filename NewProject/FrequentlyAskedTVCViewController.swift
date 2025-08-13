//
//  FrequentlyAskedTVCViewController.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 06/08/25.
//

import UIKit

class FrequentlyAskedTVCViewController: UIViewController {
    var selectedIndexPath: IndexPath?

    @IBOutlet weak var frequentlyAskedTVC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       frequentlyAskedTVC.register(UINib(nibName: "FrequentlyAskedTVC", bundle: .main), forCellReuseIdentifier: "FrequentlyAskedTVC")
        frequentlyAskedTVC.dataSource = self
        frequentlyAskedTVC.delegate = self
    }
}
extension FrequentlyAskedTVCViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrequentlyAskedTVC", for: indexPath) as! FrequentlyAskedTVC

        let imageName = (selectedIndexPath == indexPath) ? "chevron.up" : "chevron.down"
        cell.imageLabel.image = UIImage(systemName: imageName)
        cell.imageLabel.tintColor = .darkGray

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (selectedIndexPath == indexPath) ? 200 : 61
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath

        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }

        var indexPathsToReload: [IndexPath] = [indexPath]
        if let previous = previousIndexPath, previous != indexPath {
            indexPathsToReload.append(previous)
        }

        tableView.beginUpdates()
        tableView.endUpdates()
        
        // Reload the cells to update the arrow image
        tableView.reloadRows(at: indexPathsToReload, with: .none)
    }

}
