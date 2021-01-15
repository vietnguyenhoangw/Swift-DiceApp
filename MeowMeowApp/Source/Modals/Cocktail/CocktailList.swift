//
//  CocktailList.swift
//  MeowMeowApp
//
//  Created by coder on 1/15/21.
//

class QuestionList {
    
    var listOfQuestion: [Question] = []
    
    init() {
        listOfQuestion.append(Question(questionContent: "1 + 1 = 2", answer: true))
        listOfQuestion.append(Question(questionContent: "2 + 2 = 4", answer: true))
        listOfQuestion.append(Question(questionContent: "4 + 2 = 8", answer: false))
        listOfQuestion.append(Question(questionContent: "8 + 1 = 9", answer: true))
        listOfQuestion.append(Question(questionContent: "9 + 3 = 2", answer: false))
        listOfQuestion.append(Question(questionContent: "2 + 1 = 3", answer: true))
        listOfQuestion.append(Question(questionContent: "3 + 7 = 10", answer: true))
        listOfQuestion.append(Question(questionContent: "9 + 1 = 10", answer: true))
        listOfQuestion.append(Question(questionContent: "11 + 1 = 12", answer: true))
        listOfQuestion.append(Question(questionContent: "11 + 11 = 23", answer: false))
    }
}
