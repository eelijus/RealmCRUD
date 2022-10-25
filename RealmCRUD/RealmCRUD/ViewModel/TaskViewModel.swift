//
//  TaskViewModel.swift
//  RealmCRUD
//
//  Created by Suji Lee on 2022/10/25.
//

import Foundation
import SwiftUI
import RealmSwift

class TaskViewModel: ObservableObject {
    @Published var taskTitle = ""
    @Published var taskDescription = ""
    @Published var openNewPage = false
    
    //Fetched Data
    @Published var tasks: [Task] = []
    //Data Updation
    @Published var updateObject: Task?
    
    init() {
        fetchData()
    }
    
    //Fetching Data
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(Task.self)
        
        //Displaying results
        self.tasks = results.compactMap({ (task) -> Task? in
            return task
        })

    }
    
     //Adding New Data
    func addData(presentation: Binding<PresentationMode>) {
        let task = Task()
        task.taskTitle = taskTitle
        task.taskDescription = taskDescription
        
        //Getting Reference
        guard let dbRef = try? Realm() else { return }
        
        //Writing Data
        try? dbRef.write {
            //Checking and Writing Data
            guard let availableObject = updateObject else {
                dbRef.add(task)
                return
            }
            
            availableObject.taskTitle = taskTitle
            availableObject.taskDescription = taskDescription

        }
        //Updationg UI
        fetchData()
        
        //Closing View
        presentation.wrappedValue.dismiss()
    }
    
    //Deleting Data
    func deleteData(object: Task) {
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            dbRef.delete(object)
            fetchData()
        }
    }
    
    //Setting Data
    func setUpInitData() {
        //Updation
        guard let updateData = updateObject else { return }
        //Checking if it's update object and assigning values
        taskTitle = updateData.taskTitle
        taskDescription = updateData.taskDescription
    }
    
    //Clearing Data
    func deInitData() {
        updateObject = nil
        taskTitle = ""
        taskDescription = ""
    }
}
