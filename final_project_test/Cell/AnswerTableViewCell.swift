//
//  AnswerTableViewCell.swift
//  final_project_test
//
//  Created by Sheamus on 3.07.2021.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblAnswer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.viewBackground.backgroundColor = UIColor.blue
        }
        else
        {
            self.viewBackground.backgroundColor = UIColor.gray
        }

    }

}
