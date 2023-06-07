//
//  PageModel.swift
//  Pinch
//
//  Created by José Damaren on 07/06/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}
