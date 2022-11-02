//
//  Todo.swift
//  todo
//
//  Created by medicusMac on 8/21/22.
//

import Foundation

struct Todos: Codable {
    let items: Array<Todo>
}

struct Todo: Codable {
    var item: String
    var priority: Int
}
