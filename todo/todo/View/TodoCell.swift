//
//  TodoCell.swift
//  todo
//
//  Created by medicusMac on 8/21/22.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoTxtItem: UILabel!
    @IBOutlet weak var todoPriorityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(todo: Todo) {
        self.todoTxtItem.text = todo.item
        
        switch (todo.priority) {
            
        case 1:
            self.todoPriorityView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            break
            
        case 2:
            self.todoPriorityView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            break
            
        case 3:
            self.todoPriorityView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break
            
            
        default:
            self.todoPriorityView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }

}
