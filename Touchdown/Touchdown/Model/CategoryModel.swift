//
//  CategoryModel.swift
//  Touchdown
//
//  Created by José Damaren on 13/06/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
