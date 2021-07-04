//
//  Question.swift
//  final_project_test
//
//  Created by Tatiana Ozerskaya on 02/07/2021.
//

import Foundation

class Question {
    var question: String
    var answers: [Answer]
    var correctAnswerValue: Int
    
    init(question: String, answers: [Answer], correctAnswerIndex: Int){
        self.question = question
        self.answers = answers
        self.correctAnswerValue = correctAnswerIndex
    }
    
    static func fillData() -> [Question]{
        var questions = [Question]()
        
        questions.append(Question(question: "What is Earth's largest continent?", answers: [
        Answer(text: "Asia", value: 0),
            Answer(text: "Antarctica", value: 1),
            Answer(text: "Africa", value: 2),
            Answer(text: "Europe", value: 3)
        ], correctAnswerIndex: 0))
        
        questions.append(Question(question: "What country has the most coastline?", answers: [
        Answer(text: "Russia", value: 0),
            Answer(text: "Canada", value: 1),
            Answer(text: "China", value: 2),
            Answer(text: "United States", value: 3)
        ], correctAnswerIndex: 1))
        

        questions.append(Question(question: "What is the largest country in South America?", answers: [
        Answer(text: "Columbia", value: 0),
            Answer(text: "Brazil", value: 1),
            Answer(text: "Argentina", value: 2),
            Answer(text: "Peru", value: 3)
        ], correctAnswerIndex: 1))
        
        
        questions.append(Question(question: "What is the tallest mountain in the world?", answers: [
        Answer(text: "Mount Kilamanjaro", value: 0),
            Answer(text: "Aconcagua", value: 1),
            Answer(text: "Qogir", value: 2),
            Answer(text: "Mount Everest", value: 3)
        ], correctAnswerIndex: 3))
        
        questions.append(Question(question: "What city is the capital of Australia?", answers: [
        Answer(text: "Melbourne", value: 0),
            Answer(text: "Perth", value: 1),
            Answer(text: "Canberra", value: 2),
            Answer(text: "Sydney", value: 3)
        ], correctAnswerIndex: 2))
        
        
        questions.append(Question(question: "What is the smallest independent country on Earth?", answers: [
        Answer(text: "Monaco", value: 0),
            Answer(text: "Nauru", value: 1),
            Answer(text: "Grenada", value: 2),
            Answer(text: "Vatican City", value: 3)
        ], correctAnswerIndex: 3))
        
        questions.append(Question(question: "What is the deepest point in Earth's oceans?", answers: [
        Answer(text: "Tonga Trench", value: 0),
            Answer(text: "Eurasian Basin", value: 1),
            Answer(text: "Java Trench", value: 2),
            Answer(text: "Mariana Trench", value: 3)
        ], correctAnswerIndex: 3))
        
        
        questions.append(Question(question: "What is the deepest point in Earth's oceans?", answers: [
        Answer(text: "Tonga Trench", value: 0),
            Answer(text: "Eurasian Basin", value: 1),
            Answer(text: "Java Trench", value: 2),
            Answer(text: "Mariana Trench", value: 3)
        ], correctAnswerIndex: 3))
        
        
        questions.append(Question(question: "What continent contains the most fresh water?", answers: [
        Answer(text: "North America", value: 0),
            Answer(text: "Asia", value: 1),
            Answer(text: "Antarctica", value: 2),
            Answer(text: "Africa", value: 3)
        ], correctAnswerIndex: 2))
        
        questions.append(Question(question: "What ocean is home to 75% of the Earth's volcanoes?", answers: [
        Answer(text: "Pacific", value: 0),
            Answer(text: "Indian", value: 1),
            Answer(text: "Arctic", value: 2),
            Answer(text: "Atlantic", value: 3)
        ], correctAnswerIndex: 0))
        
        questions.append(Question(question: "What is the coldest sea on Earth?", answers: [
        Answer(text: "White Sea", value: 0),
            Answer(text: "Persian Gulf", value: 1),
            Answer(text: "Baltic Sea", value: 2),
            Answer(text: "Caspian Sea", value: 3)
        ], correctAnswerIndex: 0))
        
        
        return questions
    }
}

extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}
