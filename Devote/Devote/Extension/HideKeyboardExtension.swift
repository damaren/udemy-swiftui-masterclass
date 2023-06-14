//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by José Damaren on 14/06/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
