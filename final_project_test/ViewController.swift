//
//  ViewController.swift
//  final_project_test
//
//  Created by Omairys Uzcátegui on 2021-06-29.
//

import UIKit

class ViewController: UIViewController {

    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
    }

    func fillData(){
        questions.append(Question(question: "What is Earth's largest continent?", answers: ["Asia", "Antarctica", "Africa", "Europe"], correctAnswerIndex: 0))
        
        //here will be added other 9 questions
    }

}

