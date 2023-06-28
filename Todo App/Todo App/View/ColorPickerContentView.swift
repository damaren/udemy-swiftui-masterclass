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
                .frame(width: 44, height: 44)
                .cornerRadius(8)
            
            Spacer().frame(width: 8)
            
            Text(iconName)
                .frame(alignment: .leading)
        } //: HSTACK
    }
}

struct ColorPickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerContentView(iconName: "Blue")
    }
}
