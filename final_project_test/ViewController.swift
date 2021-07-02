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
        
        questions.append(Question(question: "What country has the most coastline?", answers: ["Russia", "Canada", "China", "United States"], correctAnswerIndex: 1))
        
        questions.append(Question(question: "What is the largest country in South America?", answers: ["Columbia", "Brazil", "Argentina", "Peru"], correctAnswerIndex: 1))
        
        questions.append(Question(question: "What is the tallest mountain in the world?", answers: ["Mount Kilamanjaro", "Aconcagua", "Qogir", "Mount Everest"], correctAnswerIndex: 3))
        
        questions.append(Question(question: "What city is the capital of Australia?", answers: ["Melbourne", "Perth", "Canberra", "Sydney"], correctAnswerIndex: 2))
        
        questions.append(Question(question: "What is the smallest independent country on Earth?", answers: ["Monaco", "Nauru", "Grenada", "Vatican City"], correctAnswerIndex: 3))
        
        questions.append(Question(question: "What is the deepest point in Earth's oceans?", answers: ["Tonga Trench", "Eurasian Basin", "Java Trench", "Mariana Trench"], correctAnswerIndex: 3))
        
        questions.append(Question(question: "What continent contains the most fresh water?", answers: ["North America", "Asia", "Antarctica", "Africa"], correctAnswerIndex: 2))
        
        questions.append(Question(question: "What ocean is home to 75% of the Earth's volcanoes?", answers: ["Pacific", "Indian", "Arctic", "Atlantic"], correctAnswerIndex: 0))
        
        questions.append(Question(question: "What is the coldest sea on Earth?", answers: ["White Sea", "Persian Gulf", "Baltic Sea", "Caspian Sea"], correctAnswerIndex: 0))
        
        //here will be added other 9 questions
    }

}

