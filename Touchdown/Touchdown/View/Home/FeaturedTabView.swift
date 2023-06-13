//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by José Damaren on 13/06/23.
//

import SwiftUI

let horizontalPadding: CGFloat = 15
let screenWidth = UIScreen.main.bounds.size.width

struct FeaturedTabView: View {
    let imageRatio: Double = 10/16
    let imageWidth = screenWidth - 2*horizontalPadding
    
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.horizontal, horizontalPadding)
            }
        } //: TAB
        .frame(height: imageRatio*imageWidth)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .background(Color.gray)
    }
}
