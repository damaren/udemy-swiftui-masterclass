//
//  CardModel.swift
//  LearnByDoing
//
//  Created by José Damaren on 15/06/23.
//

import SwiftUI

// MARK: - Card model
struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
