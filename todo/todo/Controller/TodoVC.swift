//
//  ViewController.swift
//  todo
//
//  Created by medicusMac on 8/21/22.
//

import UIKit

class TodoVC: UIViewController {

    @IBOutlet weak var todoItemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todos: Todos = Todos(items: [Todo(item: "", priority: 0)])
    var todo: Todo = Todo(item: "", priority: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NetworkService.shared.getTodos { (todos) in
            self.todos = todos
            self.todoTableView.reloadData()
        } onError: { errorMsg in
            debugPrint(errorMsg)
        }

        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoItemTxt.delegate = self
        
//        let card = "Aces"
//
//        switch card {
//        case "Aces":
//            fallthrough
//
//        case "Spades", "Clovers", "Hearts":
//            print("Spades Clovers Hearts")
//
//        default:
//            print("No Card")
//        }
//
//        let numbers = [1, 3, 5, 7, 9]
//        let result = numbers.map { $0 * 10 }
//        print(result)
//
//        let digits = Array(1..<10)
//        print(digits.count)
//
//        let countries = [String](repeating: "Belgium", count: 2)
//        print(countries.count)
//
//        var cars = Set<String>()
//        cars.insert("Volvo")
//        cars.insert("Mercedes")
//        cars.insert("Ford")
//        cars.insert("Volvo")
//        print(cars.count)
//
//        var trees = [String]()
//        trees.reserveCapacity(2)
//        trees.append("Oak")
//        trees.append("Redwood")
//        trees.append("Evergreen")
//        print(trees.count)
    }

    @IBAction func addBtn(_ sender: Any) {
        guard let todoItem = todoItemTxt.text else {
            return
        }
        
        let todo = Todo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        
        NetworkService.shared.addTodo(todo: todo) { todos in
            self.todoItemTxt.text = ""
            self.prioritySegment.selectedSegmentIndex = 0
            self.todos = todos
            self.todoTableView.reloadData()
        } onError: { errorMsg in
            debugPrint(errorMsg)
        }
    }
    
}

extension TodoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todoTableView.dequeueReusableCell(withIdentifier: "TodoCell") as? TodoCell
        else {
            return UITableViewCell()
        }
        
        let todo = todos.items[indexPath.row]
        
        cell.configureCell(todo: todo)
        return cell
    }
    
    
}

extension TodoVC: UITextFieldDelegate {
    
}

