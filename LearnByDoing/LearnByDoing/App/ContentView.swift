//
//  ContentView.swift
//  LearnByDoing
//
//  Created by José Damaren on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var cards: [Card] = cardData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding()
        }
        
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
    }
}
