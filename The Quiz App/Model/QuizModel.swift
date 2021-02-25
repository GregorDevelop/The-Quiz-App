//
//  QuizModel.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import Foundation

protocol QuizProtocol {
    func questionsRetrieved(_ questions: [Question])
}

class QuizModel {
    
    var delegate: QuizProtocol?
    
    func getQuestions() {
        
        delegate?.questionsRetrieved([Question]())
    }
    
}
