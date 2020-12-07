//
//  ViewModel.swift
//  ToDoMVVM
//
//  Created by Mayuresh Rao on 12/5/20.
//

import Foundation

class ToDoViewModel {
    private var todos: [ToDo]
    
    var count: Int {
        return todos.count
    }
    
    init() {
        todos = [ToDo]()
        addDummyData()
    }
    
    private func addDummyData(){
        for i in 0...19 {
            todos.append(ToDo(task: "Task \(i)", completed: false, notes: "Sample Task"))
        }
    }
    
    func itemAt(index: Int) -> ToDo {
        return todos[index]
    }
    
    func updateCompletedState(index: Int, newValue: Bool) {
        todos[index].completed = newValue
    }
    
    func addNew(todo: ToDo) {
        todos.append(todo)
    }
}


