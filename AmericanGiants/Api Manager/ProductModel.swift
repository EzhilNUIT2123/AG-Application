//
//  ProductModel.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 12/05/23.
//

import Foundation

struct ProductModel :Codable {
    let id : Int
    let title : String
    let price : Double
    let image : String
    let rating : Rating
    
}

struct Rating:Codable {
    let rate : Double
    let count : Int
}
