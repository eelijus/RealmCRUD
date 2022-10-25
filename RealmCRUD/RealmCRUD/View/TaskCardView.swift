//
//  TaskCardView.swift
//  RealmCRUD
//
//  Created by Suji Lee on 2022/10/25.
//

import SwiftUI
import RealmSwift

struct TaskCardView: View {
    
    let task: Task

    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            Rectangle()
                .fill(.black)
                .frame(width: 3)
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text(task.taskTitle)
                            .font(.title2.bold())
                        if task.descriptionVisibility && !task.taskDescription.isEmpty {
                            Text(task.taskDescription)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .hLeading()
                    Text(task.taskDate.formatted(date: .omitted, time: .shortened))
                }
            }
            .padding()
            .hLeading()
        }
        .hLeading()
        .background(.white) // 클릭위해서
    }
}

// MARK: UI Design Helper functions
//이 extension이 Spacer(), .frame() 등의 사용을 줄여주고 코드의 가독성도 좋게 해줄 것임
extension View {
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    // MARK: Safe Area
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
