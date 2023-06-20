//
//  HeaderModel.swift
//  Avocados
//
//  Created by José Damaren on 19/06/23.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
