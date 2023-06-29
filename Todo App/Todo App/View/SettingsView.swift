//
//  SettingsView.swift
//  Todo App
//
//  Created by José Damaren on 27/06/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    // THEME
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                Form {
                    // MARK: - SECTION 1
                    
                    Section(header: Text("Choose the app icon"), content: {
                        Menu(content: {
                            Picker("App Icons", selection: $iconSettings.currentIndex, content: {
                                ForEach(0..<iconSettings.iconNames.count, id: \.self) { index in
                                    ColorPickerContentView(iconName: self.iconSettings.iconNames[index] ?? "Blue")
                                }
                            })
                            .onReceive([self.iconSettings.currentIndex].publisher.first(), perform: { value in
                                let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                                if index != value {
                                    UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                                        if let error = error {
                                            print(error.localizedDescription)
                                        } else {
                                            print("Successs! You have changed the app icon.")
                                        }
                                    }
                                }
                            })
                        }, label: {
                            HStack {
                                Image(uiImage: UIImage(named: self.iconSettings.iconNames[iconSettings.currentIndex] ?? "Blue") ?? UIImage())
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(8)
                                
                                Text("App Icons".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        })
                    }) //: SECTION 1
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 2
                    Section(header:
                        HStack {
                            Text("Choose the app theme")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(themes[self.theme.themeSettings].themeColor)
                        }
                    , content: {
                        List {
                            ForEach(themes, id: \.id) { theme in
                                Button(action: {
                                    self.theme.themeSettings = theme.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                }, label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(theme.themeColor)
                                        Text(theme.themeName)
                                    }
                                }) //: BUTTON
                                .tint(.primary)
                            }
                        }
                    }) //: SECTION 2
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 3
                    
                    Section(header: Text("Follow us on social media"), content: {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "http://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "http://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "http://www.udemy.com/user/robert-petras")
                    }) //: SECTION 3
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 4
                    
                    Section(header: Text("About the application"), content: {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "José Damaren")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }) //: SECTION 4
                    .padding(.vertical, 3)
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            } //: VSTACK
            .navigationBarItems(trailing:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
        .tint(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(IconNames())
    }
}
