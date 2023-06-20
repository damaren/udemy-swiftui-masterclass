//
//  FactModel.swift
//  Avocados
//
//  Created by José Damaren on 19/06/23.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
