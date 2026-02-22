//
//  TodoViewModel.swift
//  NewTodoapp
//
//  Created by Awadhesh on 2025-11-27.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = [] {
        didSet { saveItems() }
    }
    
    private let KEY = "TODO_ITEMS_KEY"
    
    init() {
        loadItems()
    }
    
    func addTask(title: String) {
        let new = TodoItem(title: title)
        items.append(new)
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func toggle(_ item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isDone.toggle()
        }
    }
    
    private func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: KEY)
        }
    }
    
    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: KEY),
              let saved = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return }
        
        items = saved
    }
}
