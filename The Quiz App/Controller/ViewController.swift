//
//  ViewController.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import UIKit

class ViewController: UIViewController, QuizProtocol {

    
    var model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getQuestions()
        
    }

    //MARK: - QuestionsRetrieved protocol 
    
    func questionsRetrieved(_ questions: [Question]) {

    }

}

