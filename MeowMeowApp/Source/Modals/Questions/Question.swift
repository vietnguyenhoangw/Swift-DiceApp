//
//  Question.swift
//  MeowMeowApp
//
//  Created by coder on 1/8/21.
//

class Question {
    
    var questionContent: String = ""
    var answer: Bool = false
    
    init(questionContent: String, answer: Bool) {
        self.questionContent = questionContent
        self.answer = answer
    }
    
}
