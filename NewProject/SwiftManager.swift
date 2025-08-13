//
//  SwiftManager.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 05/08/25.
//

//import Foundation
//
//class HotelService {
//    static let shared = HotelService()
//
//    func fetchHotels(completion: @escaping (Result<[Hotel], Error>) -> Void) {
//        guard let url = URL(string: "https://syriabookingcacheapi.azurewebsites.net/api/HotelPublic/aggregates/") else {
//            print("❌ Invalid URL")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//                return
//            }
//
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                }
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let hotelResponse = try decoder.decode(HotelResponse.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(hotelResponse.data!))
//                }
//            } catch let DecodingError.dataCorrupted(context) {
//                print("❌ Data corrupted:", context)
//                DispatchQueue.main.async {
//                    completion(.failure(DecodingError.dataCorrupted(context)))
//                }
//            } catch let DecodingError.keyNotFound(key, context) {
//                print("❌ Key '\(key)' not found:", context.debugDescription)
//                DispatchQueue.main.async {
//                    completion(.failure(DecodingError.keyNotFound(key, context)))
//                }
//            } catch let DecodingError.typeMismatch(type, context) {
//                print("❌ Type mismatch for type \(type):", context.debugDescription)
//                DispatchQueue.main.async {
//                    completion(.failure(DecodingError.typeMismatch(type, context)))
//                }
//            } catch let DecodingError.valueNotFound(value, context) {
//                print("❌ Value '\(value)' not found:", context.debugDescription)
//                DispatchQueue.main.async {
//                    completion(.failure(DecodingError.valueNotFound(value, context)))
//                }
//            } catch {
//                print("❌ Unknown error: \(error)")
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//
//        task.resume()
//    }
//}
