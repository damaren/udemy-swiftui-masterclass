//
//  HeaderComponent.swift
//  HoneyMoon
//
//  Created by José Damaren on 30/06/23.
//

import SwiftUI

struct HeaderComponent: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(.secondary)
                .opacity(0.25)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
