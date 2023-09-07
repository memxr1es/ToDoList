//
//  ListView.swift
//  ToDoList
//
//  Created by Никита Котов on 03.09.2023.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)

                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Список дел 📝")
        .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
        .animation(.spring(), value: isEditing)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if !listViewModel.items.isEmpty {
                    Button {
                        isEditing.toggle()
                    } label: {
                        Text(isEditing ? "Сохранить" : "Изменить")
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Добавить") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
