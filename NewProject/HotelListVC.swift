// Hotel Booking App with City Dropdown and Hotel Details Display (with Check-in/Check-out, Rating, Reviews, Image)

import UIKit
import Foundation

import Foundation

// MARK: – Root Response
struct HotelResponse: Codable {
    let message: String?
    let data: [Hotel]?
}

// MARK: – Hotel Details
struct Hotel: Codable {
    let id: String?
    let name: String?
    let city: String?
    let shortDescription: String?
    let description: String?
    let type: String?
    let starRating: Int?
    let hotelChain: String?
    let addressLine1: String?
    let addressLine2: String?
    let stateOrProvince: String?
    let postalCode: String?
    let country: String?
    let email: String?
    let primaryPhone: String?
    let checkInTime: String?
    let checkOutTime: String?
    let acceptedCurrencies: String?
    let languagesSpoken: String?
    let covidSafetyLevel: String?
    let discountText: String?
    let coverImageUrl: String?
    let facilities: String?
    let landmarkDescription: String?
    let averageRating: String?
    let reviewCount: String?
    let minRoomPrice: String?
    let amenities: String?
    let coverImageSignedUrl: String?
    
    let reviews: [Review]?
    let landmarks: [Landmark]?
    let images: [String]?
    let rooms: [WrappedRoom]?
}

// MARK: – Review Struct
struct Review: Codable {
    let id: String?
    let hotelId: String?
    let reviewerName: String?
    let rating: Int?
    let reviewText: String?
    let createdOn: String?
}

// MARK: – Landmark Struct
struct Landmark: Codable {
    let id: String?
    let hotelId: String?
    let name: String?
    let landmarkType: String?
    let distanceKm: Double?
    let isActive: Bool?
}

// MARK: – Room Wrapper & Nested Details
struct WrappedRoom: Codable {
    let room: RoomDetails?
    let coverImage: String?
    let rates: [Rate]?
}

struct RoomDetails: Codable {
    let id: String?
    let hotelId: String?
    let roomType: String?
    let bedType: String?
    let maxAdults: Int?
    let maxChildren: Int?
    let roomSize: String?
    let basePrice: Double?
    let roomStatus: String?
    let refundPolicy: String?
    let breakfastIncluded: Bool?
    let availableRooms: Int?
    let description: String?
    let amenities: String?
    let inventory: Int?
}

// MARK: – Rate Struct
struct Rate: Codable {
    let id: String?
    let roomId: String?
    let effectiveDate: String?
    let price: Double?
    let notes: String?
}

// MARK: - API Service
class APIService {
    static let shared = APIService()

    func fetchHotels(completion: @escaping (Result<[Hotel], Error>) -> Void) {
        let urlString = "https://syriabookingcacheapi.azurewebsites.net/api/HotelPublic/aggregates/"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let noDataError = NSError(domain: "NoData", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(noDataError))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(HotelResponse.self, from: data)
                let hotels = decoded.data ?? []
                completion(.success(hotels))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

// MARK: - ViewModel with City Filter
class HotelListViewModel {
    var hotels: [Hotel] = []
    var filteredHotels: [Hotel] = []
    var availableCities: [String] = []

    func loadHotels(completion: @escaping () -> Void) {
        APIService.shared.fetchHotels { result in
            switch result {
            case .success(let hotels):
                self.hotels = hotels
                self.availableCities = Array(Set(hotels.compactMap { $0.city })).sorted()
                completion()
            case .failure(let error):
                print("API Error: \(error.localizedDescription)")
                completion()
            }
        }
    }

    func filterHotels(for city: String) {
        self.filteredHotels = hotels.filter { ($0.city?.lowercased() ?? "") == city.lowercased() }
    }
}


class HotelTableViewCell: UITableViewCell {
    static let identifier = "HotelTableViewCell"

    let nameLabel = UILabel()
    let infoLabel = UILabel()
    let hotelImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        hotelImageView.translatesAutoresizingMaskIntoConstraints = false
        hotelImageView.contentMode = .scaleAspectFill
        hotelImageView.clipsToBounds = true
        contentView.addSubview(hotelImageView)

        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.textColor = .darkGray
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            hotelImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            hotelImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hotelImageView.widthAnchor.constraint(equalToConstant: 80),
            hotelImageView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: hotelImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }


    func configure(with hotel: Hotel) {
        nameLabel.text = hotel.name ?? "No Name"

        let city = hotel.city ?? "N/A"
        let checkInDate = hotel.checkInTime ?? "N/A"
        let checkOutDate = hotel.checkOutTime ?? "N/A"
        let checkInTime = hotel.checkInTime ?? "N/A"
        let checkOutTime = hotel.checkOutTime ?? "N/A"
        let rating = hotel.averageRating ?? "0"
        let reviews = hotel.reviewCount ?? "0"

        infoLabel.text = """
        City: \(city)
        Check-in Date: \(checkInTime)
        Check-out Date: \(checkOutTime)
        Rating: \(rating) (\(reviews) reviews)
        """

        // ✅ Try using the signed URL
        let imageUrlString = hotel.coverImageSignedUrl ?? hotel.coverImageUrl

        if let imageUrlString = imageUrlString, let url = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        self.hotelImageView.image = UIImage(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.hotelImageView.image = UIImage(systemName: "photo")
                    }
                }
            }.resume()
        } else {
            self.hotelImageView.image = UIImage(systemName: "photo")
        }
    }

}

// MARK: - ViewController with City Dropdown & Hotel Display
class HotelListVC: UIViewController, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    let tableView = UITableView()
    let cityPicker = UIPickerView()
    let searchButton = UIButton(type: .system)
    let viewModel = HotelListViewModel()
    var selectedCity: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hotel Search"
        view.backgroundColor = .white

        cityPicker.dataSource = self
        cityPicker.delegate = self

        setupSearchUI()
        setupTableView()

        viewModel.loadHotels {
            DispatchQueue.main.async {
                self.cityPicker.reloadAllComponents()
            }
        }
    }

    func setupSearchUI() {
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityPicker)

        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        view.addSubview(searchButton)

        NSLayoutConstraint.activate([
            cityPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            cityPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityPicker.heightAnchor.constraint(equalToConstant: 120),

            searchButton.topAnchor.constraint(equalTo: cityPicker.bottomAnchor, constant: 8),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func searchTapped() {
        guard let city = selectedCity else { return }
        viewModel.filterHotels(for: city)
        tableView.reloadData()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(HotelTableViewCell.self, forCellReuseIdentifier: HotelTableViewCell.identifier)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - PickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.availableCities.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.availableCities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = viewModel.availableCities[row]
    }

    // MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredHotels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelTableViewCell.identifier, for: indexPath) as? HotelTableViewCell else {
            return UITableViewCell()
        }
        let hotel = viewModel.filteredHotels[indexPath.row]
        cell.configure(with: hotel)
        
        return cell
    }
}
