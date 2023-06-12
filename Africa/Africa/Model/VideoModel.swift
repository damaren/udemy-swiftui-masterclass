//
//  VideoModel.swift
//  Africa
//
//  Created by José Damaren on 11/06/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
