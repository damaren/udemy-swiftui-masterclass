//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by José Damaren on 13/06/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
