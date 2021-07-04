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
    @IBAction func next(_ sender: Any) {
        if selectedAnswer == 4 {
            message.text = "Choose some answer!"
        } else {
            if selectedAnswer == choosenQuestions[currentQuestion].correctAnswerValue {
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
        questions = Question.fillData()
        startAgain()
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
        answer1.text = choosenQuestions[currentQuestion].answers[0].text
        answer2.text = choosenQuestions[currentQuestion].answers[1].text
        answer3.text = choosenQuestions[currentQuestion].answers[2].text
        answer4.text = choosenQuestions[currentQuestion].answers[3].text
        
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

