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
    
    var numCorrect = 0
    
    var resultDialog: ResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the result dialog
        resultDialog = storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController
        resultDialog?.modalPresentationStyle = .overCurrentContext
        
        // Set self as the delegate and datasource for the tableview
        tableView.dataSource = self
        tableView.delegate = self
       
        // Set up the model
        model.delegate = self
        model.getQuestions()
    }

    
    func displayQuestion() {
        
        // Check if there are questions and check that the currentQuestionIndex is not out of bounds
        guard questions.count > 0 && currentQuestionIndex < questions.count else {return}
        
        // Display the question text
        questionLabel.text = questions[currentQuestionIndex].question
        
        // Reload the answers table
        tableView.reloadData()
    }
    
    
    // MARK: - QuizProtocol Methods

    func questionsRetrieved(_ questions: [Question]) {
        // Get a reference to the questions
        self.questions = questions
        
        displayQuestion()
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
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Customize it
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            let question = questions[currentQuestionIndex]
            if question.answers != nil && indexPath.row < question.answers!.count {
                label!.text = question.answers![indexPath.row]
            }
        }
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has tapped on a row, check if it's the right answer
        let currentQuestion = questions[currentQuestionIndex]
        
        if currentQuestion.correctAnswerIndex == indexPath.row {
            // User got it right

        } else {
            // User got it wrong

        }
        
        
        if resultDialog != nil {
            present(resultDialog!, animated: true, completion: nil)
        }
        
        currentQuestionIndex += 1
        displayQuestion()
    }
    
    
    
}

