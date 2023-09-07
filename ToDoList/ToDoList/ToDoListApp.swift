//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Никита Котов on 03.09.2023.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - точка данных
 View - UI (Пользовательский интерфейс)
 ViewModel - управление Models для View
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
