//
//  ViewController.swift
//  final_project_test
//
//  Created by Omairys Uzcátegui on 2021-06-29.
//

import UIKit

class ViewController: UIViewController {

    var questions = [Question]()
    var correctAnswerCounter = 0
    var choosenQuestions = [Question]()
    var selectedAnswer = 4
    var currentQuestion = 0
    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    @IBOutlet weak var checkbox1: UIButton!
    @IBOutlet weak var checkbox2: UIButton!
    @IBOutlet weak var checkbox3: UIButton!
    @IBOutlet weak var checkbox4: UIButton!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func chbox1(_ sender: UIButton) {
        sender.isSelected = true
        checkbox2.isSelected = false
        checkbox3.isSelected = false
        checkbox4.isSelected = false
        selectedAnswer = 0
        message.text = ""
    }
    @IBAction func chbox2(_ sender: UIButton) {
        sender.isSelected = true
        checkbox1.isSelected = false
        checkbox3.isSelected = false
        checkbox4.isSelected = false
        selectedAnswer = 1
        message.text = ""
    }
    @IBAction func chbox3(_ sender: UIButton) {
        sender.isSelected = true
        checkbox2.isSelected = false
        checkbox1.isSelected = false
        checkbox4.isSelected = false
        selectedAnswer = 2
        message.text = ""
    }
    @IBAction func chbox4(_ sender: UIButton) {
        sender.isSelected = true
        checkbox2.isSelected = false
        checkbox3.isSelected = false
        checkbox1.isSelected = false
        selectedAnswer = 3
        message.text = ""
    }
    
    @IBAction func previous(_ sender: Any) {
        currentQuestion = currentQuestion - 1
        setQuestion()
    }
    
    @IBAction func next(_ sender: Any) {
        if selectedAnswer == 4 {
            message.text = "Choose some answer!"
        } else {
            if selectedAnswer == choosenQuestions[currentQuestion].correctAnswerIndex {
                correctAnswerCounter = correctAnswerCounter + 1
            }
            if currentQuestion == 4 {
                //todo move to the last screen with correctAnswerCounter value
                // if score == 3,4 5 -> show only message (button "try again" is hidden and disabled )
                //if sccore == 0,1,2 -> show the message and the button "try again"
            } else {
                checkbox1.isSelected = false
                checkbox2.isSelected = false
                checkbox3.isSelected = false
                checkbox4.isSelected = false
                currentQuestion = currentQuestion + 1
                setQuestion()
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fillData()
        prevButton.isHidden = true  //todo set is as hidden == false if back will be supported. nedd to save previous choosen values and update correctAnswerCounter
        startAgain()
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
    
    func chooseQuestions() -> [Question]{
        var chQuest = [Question]()
        let shuffeledQuestions = questions.shuffled()
        for i in 0..<5 {
            chQuest.append(shuffeledQuestions[i])
        }
        return chQuest
    }
    
    func setQuestion(){
        questionNumber.text = String(currentQuestion + 1) + "/5"
        selectedAnswer = 4
        question.text = choosenQuestions[currentQuestion].question
        answer1.text = choosenQuestions[currentQuestion].answers[0]
        answer2.text = choosenQuestions[currentQuestion].answers[1]
        answer3.text = choosenQuestions[currentQuestion].answers[2]
        answer4.text = choosenQuestions[currentQuestion].answers[3]
        
        checkbox1.isSelected = false
        checkbox1.isSelected = false
        checkbox1.isSelected = false
        checkbox1.isSelected = false
        
        message.text = ""
        
        if currentQuestion == 4 {
            nextButton.setTitle("finish", for: .normal)
        } else {
            nextButton.setTitle("next>", for: .normal)
        }
    }
    
    func startAgain(){
        choosenQuestions = chooseQuestions()
        correctAnswerCounter = 0
        currentQuestion = 0
        setQuestion()
    }

}

