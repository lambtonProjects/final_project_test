//
//  Question.swift
//  final_project_test
//
//  Created by Tatiana Ozerskaya on 02/07/2021.
//

import Foundation

class Question {
    var question: String
    var answers: [String]
    var correctAnswerIndex: Int
    
    init(question: String, answers: [String], correctAnswerIndex: Int){
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}
