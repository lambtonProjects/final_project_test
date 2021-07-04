//
//  QuesitionViewController.swift
//  final_project_test
//
//  Created by Sheamus on 3.07.2021.
//

import Foundation
import UIKit

class QuesionViewController: UIViewController {
    
    @IBOutlet weak var tvQuestion: UITextView!
    @IBOutlet weak var tableViewAnswers: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblWarning: UILabel!
    @IBOutlet weak var lblQuestionIndicator: UILabel!
    
    var maxQuestionCount = 5
    var selectedQuestions = [Question]()
    var currentQuestionIndex = 0
    var correctAnswers = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
        bindQuestion()
        configureTableView()
        configureDesign()
        
    }
    
    func configureTableView() {
        tableViewAnswers.delegate = self
        tableViewAnswers.dataSource = self
        tableViewAnswers.allowsMultipleSelection = false
        
    }
    
    func configureData() {
        selectedQuestions = Array(Question.fillData().choose(self.maxQuestionCount))
        
        //Change the order of answers
        for item in selectedQuestions {
            item.answers = Array(item.answers.shuffled())
        }
    }
    
    func bindQuestion() {
        let question = selectedQuestions[currentQuestionIndex]
        tvQuestion.text = question.question
        tableViewAnswers.reloadData()
        updateCurrentQuestionIndicator()
    }
    
    func configureDesign() {
        self.tvQuestion.layer.borderWidth = 1
        self.tvQuestion.layer.borderColor = UIColor.lightGray.cgColor
        self.tvQuestion.layer.cornerRadius = 5
        
        self.btnNext.layer.borderWidth = 1
        self.btnNext.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        
        if tableViewAnswers.indexPathForSelectedRow != nil {
            
            let selectedAnswer = selectedQuestions[currentQuestionIndex].answers[tableViewAnswers.indexPathForSelectedRow!.row]
            
            if selectedAnswer.value == selectedQuestions[currentQuestionIndex].correctAnswerValue {
                correctAnswers += 1
            }
            if currentQuestionIndex < maxQuestionCount - 1 {
                loadNextQuestion()
            }
            else
            {
                navigateToResult()
            }
            
        }
        else {
            lblWarning.text = "Please select any answer to move next question."
        }
        
    }
    
    func loadNextQuestion() {
        currentQuestionIndex += 1
        bindQuestion()
        
    }
    
    func updateCurrentQuestionIndicator() {
        self.lblQuestionIndicator.text = "\(currentQuestionIndex + 1) / \(maxQuestionCount)"
    }
    
    func restart(){
        currentQuestionIndex = 0
        correctAnswers = 0
        
        configureData()
        bindQuestion()
    }
    
    func navigateToResult() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        
        vc?.correctAnswers = self.correctAnswers
        vc?.maxQuestions = self.maxQuestionCount
        vc?.parentVC = self
        
        self.present(vc!, animated: true, completion: {
            vc?.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
          })
    }
    
}

//MARK: Delegate functions for UITableView
extension QuesionViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return selectedQuestions[currentQuestionIndex].answers.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell") as! AnswerTableViewCell
        
        cell.lblAnswer.text = selectedQuestions[currentQuestionIndex].answers[indexPath.row].text
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

