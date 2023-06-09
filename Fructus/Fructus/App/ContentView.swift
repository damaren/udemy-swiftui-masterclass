//
//  ContentView.swift
//  Fructus
//
//  Created by José Damaren on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(fruits.shuffled(), content: { fruit in
                    NavigationLink(destination: FruitsDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                })
            })
            .navigationTitle("Fruits")
            .toolbar(content: {
                Button(action: {
                    isShowingSettings = true
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                }) //: BUTTON
                .sheet(isPresented: $isShowingSettings, content: {
                    SettingsView()
                })
            })
        }) //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
