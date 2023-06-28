//
//  ContentView.swift
//  Todo App
//
//  Created by José Damaren on 22/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @EnvironmentObject var iconSettings: IconNames
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(self.todos, id: \.self) { todo in
                        HStack {
                            Text(todo.name ?? "Unknown")
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                        }
                    } //: FOREACH
                    .onDelete(perform: deleteTodo)
                } //: LIST
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement:.navigationBarTrailing, content: {
                        Button(action: {
                            self.showingSettingsView.toggle()
                        }, label: {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                        }) //: ADD BUTTON
                    })
                    
                    ToolbarItem(placement:.navigationBarLeading, content: {
                        EditButton()
                    })
                })
                .sheet(isPresented: $showingSettingsView, content: {
                    SettingsView().environmentObject(self.iconSettings)
                })
                
                // MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                }
            } //: ZSTACK
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
            })
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animatingButton ? 0.15 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: self.animatingButton)
                    
                    Button(action: {
                        self.showingAddTodoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    })
                    .onAppear() {
                        self.animatingButton.toggle()
                    }
                } //: ZSTACK
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        } //: NAVIGATION
    }
    
    // MARK: - FUNCTIONS
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - PREVIEW
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
