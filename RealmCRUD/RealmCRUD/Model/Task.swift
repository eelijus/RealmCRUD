//
//  Task.swift
//  RealmCRUD
//
//  Created by Suji Lee on 2022/10/25.
//

import Foundation
import RealmSwift

//Creating Realm Object

class Task: Object, Identifiable {
    @objc dynamic var id: Date = Date()
    @objc dynamic var taskTitle = ""
    @objc dynamic var taskDescription = ""
    @objc dynamic var taskDate: Date = Date()
    @objc dynamic var descriptionVisibility: Bool = true
    @objc dynamic var isCompleted: Bool = false
    
}
