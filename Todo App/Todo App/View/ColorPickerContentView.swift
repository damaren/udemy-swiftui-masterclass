//
//  ColorPickerContentView.swift
//  Todo App
//
//  Created by José Damaren on 28/06/23.
//

import SwiftUI

struct ColorPickerContentView: View {
    
    var iconName: String
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: iconName) ?? UIImage())
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
            
            Spacer().frame(width: 8)
            
            Text(iconName)
                .frame(alignment: .leading)
        } //: HSTACK
        .frame(height: 44)
    }
}

struct ColorPickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerContentView(iconName: "Blue Dark")
    }
}
