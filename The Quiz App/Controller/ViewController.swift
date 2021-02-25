//
//  ViewController.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import UIKit

class ViewController: UIViewController, QuizProtocol, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getQuestions()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - QuizProtocol Methods

    func questionsRetrieved(_ questions: [Question]) {
        // Get a reference to the questions
        self.questions = questions
    }

    // MARK: - UITableView DataSource and Delegate Methods

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Make sure that the questions array actually contains at least a question
        guard questions.count > 0 else {return 0}
        
        // Return the number of answers for this question
        let currentQuestion = questions[currentQuestionIndex]
        
        if currentQuestion.answers != nil {
            return currentQuestion.answers!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            
        }
        
        return cell
    }
    
}

