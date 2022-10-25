//
//  Home.swift
//  RealmCRUD
//
//  Created by Suji Lee on 2022/10/25.
//

import SwiftUI

struct Home: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(taskViewModel.tasks) { task in
//                        VStack(alignment: .leading, spacing: 10,content: {
//                            Text(task.taskTitle)
//                            Text(task.taskDescription)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        })


                        TaskCardView(task: task)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {taskViewModel.deleteData(object: task)}, label: {
                                Text("Delete Item")
                            })
                            Button(action: {
                                taskViewModel.updateObject = task
                                taskViewModel.openNewPage.toggle()
                            }, label: {
                                Text("Update Item")
                            })
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("Realm DB")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {taskViewModel.openNewPage.toggle()}) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $taskViewModel.openNewPage, content: {
                ModalView()
                    .environmentObject(taskViewModel)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
