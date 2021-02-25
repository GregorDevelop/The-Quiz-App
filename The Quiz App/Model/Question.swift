//
//  Question.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import Foundation


struct Question: Codable {
    
    var question: String?
    var answers: [String]?
    var correctAnswerIndex: Int?
    var feedback: String?
}
