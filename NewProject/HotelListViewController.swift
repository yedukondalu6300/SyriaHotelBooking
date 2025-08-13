//
//  HotelListViewController.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 05/08/25.
//
//
//import UIKit
//
//class HotelListViewController: UIViewController {
//    var hotels: [Hotel] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        HotelService.shared.fetchHotels { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let hotelList):
//                    self?.hotels = hotelList
//                    // Reload your tableView or collectionView here
//                    print("✅ Hotels fetched: \(hotelList.count)")
//                    print("✅ Hotels fetched: \(hotelList.description)")
//                case .failure(let error):
//                    print("❌ Error fetching hotels: \(error)")
//                }
//            }
//        }
//    }
//}
//extension HotelListViewController : UITableViewDelegate,UITableViewDataSource {
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return hotels.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let hotel = hotels[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath)
//        cell.textLabel?.text = hotel.name
//        return cell
//    }
//}
