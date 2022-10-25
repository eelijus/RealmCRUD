//
//  ModalView.swift
//  RealmCRUD
//
//  Created by Suji Lee on 2022/10/25.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("", text: $taskViewModel.taskTitle)
                }
                Section(header: Text("Description")) {
                    TextField("", text: $taskViewModel.taskDescription)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(taskViewModel.updateObject == nil ? "Add Data" : "Update")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {taskViewModel.addData(presentation: presentation)}, label: {
                        Text("Done")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .onAppear(perform: taskViewModel.setUpInitData)
        .onDisappear(perform: taskViewModel.deInitData)

    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
