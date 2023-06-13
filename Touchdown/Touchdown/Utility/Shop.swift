//
//  Shop.swift
//  Touchdown
//
//  Created by José Damaren on 13/06/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
