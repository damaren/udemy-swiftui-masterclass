//
//  ButtonModifier.swift
//  HoneyMoon
//
//  Created by José Damaren on 30/06/23.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Capsule().fill(.pink))
            .foregroundColor(.white)
    }
}
