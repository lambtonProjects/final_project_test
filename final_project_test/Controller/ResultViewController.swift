//
//  ResultViewController.swift
//  final_project_test
//
//  Created by Sheamus on 3.07.2021.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var btnRestart: UIButton!
    
    var parentVC : QuesionViewController?
    var correctAnswers = 0
    var maxQuestions = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bind()
    }
    
    func bind() {
        self.lblScore.text = "\(correctAnswers) out of \(maxQuestions)"
        
        if correctAnswers <= 2 {
            lblComment.text = "Please try again!"
            self.btnRestart.isHidden = false
        }
        else if correctAnswers == 3 {
            lblComment.text = "Good job!"
        }
        else if correctAnswers == 4 {
            lblComment.text = "Excellent work!"
        }
        else if correctAnswers >= 5 {
            lblComment.text = "You are a genius!"
        }

    }
    
    @IBAction func btnRestartTouched(_ sender: Any) {
        
        self.dismiss(animated: true) {
            self.parentVC?.restart()
        }
    }
    
}
