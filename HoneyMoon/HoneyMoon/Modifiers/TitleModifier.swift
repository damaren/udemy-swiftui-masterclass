//
//  TitleModifier.swift
//  HoneyMoon
//
//  Created by José Damaren on 30/06/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
