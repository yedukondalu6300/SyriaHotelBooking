//
//  ModelSwift.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 05/08/25.
//
//
//import Foundation
//struct HotelResponse: Codable {
//    let message: String
//    let data: [Hotel]
//}
//
//struct Hotel: Codable {
//    let id: String?
//    let name: String?
//    let city: String?
//    let shortDescription: String?
//    let description: String?
//    let type: String?
//    let starRating: Int?
//    let addressLine1: String?
//    let addressLine2: String?
//    let stateOrProvince: String?
//    let country: String?
//    let email: String?
//    let primaryPhone: String?
//    let checkInTime: String?
//    let checkOutTime: String?
//    let acceptedCurrencies: String?
//    let languagesSpoken: String?
//    let discountText: String?
//    let coverImageUrl: String?
//    let averageRating: String?
//    let reviewCount: String?
//    let minRoomPrice: String?
//    let amenities: String?
//    let reviews: [Review]
//    let rooms: [HotelRoom]
//}
//
//struct Review: Codable {
//    let id: String
//    let hotelId: String
//    let reviewerName: String
//    let rating: Int
//    let reviewText: String?
//    let createdOn: String
//}
//
//struct HotelRoom: Codable {
//    let room: RoomDetail
//    let coverImage: String?
//    let rates: [Rate]
//}
//
//struct RoomDetail: Codable {
//    let id: String
//    let hotelId: String
//    let roomType: String
//    let bedType: String
//    let maxAdults: Int
//    let maxChildren: Int
//    let roomSize: String
//    let basePrice: Double
//    let roomStatus: String
//    let refundPolicy: String
//    let breakfastIncluded: Bool
//    let availableRooms: Int
//    let description: String?
//    let amenities: String
//    let inventory: Int
//}
//
//struct Rate: Codable {
//    let id: String
//    let roomId: String
//    let effectiveDate: String
//    let price: Double
//    let notes: String
//}
