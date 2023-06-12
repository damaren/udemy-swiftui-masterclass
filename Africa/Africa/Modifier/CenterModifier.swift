//
//  CenterModifier.swift
//  Africa
//
//  Created by José Damaren on 12/06/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
