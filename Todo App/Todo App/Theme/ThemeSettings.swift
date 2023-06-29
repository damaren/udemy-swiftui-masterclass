//
//  ThemeSettings.swift
//  Todo App
//
//  Created by José Damaren on 29/06/23.
//

import SwiftUI

// MARK: - THEME CLASS

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    static let shared = ThemeSettings()
}
