//
//  Note.swift
//  Notes Watch App
//
//  Created by José Damaren on 15/06/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
