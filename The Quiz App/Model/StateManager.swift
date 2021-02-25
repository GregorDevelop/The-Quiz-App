//
//  StateManager.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import Foundation


class StateManager {
    
    static var numCorrectKey = "NumCorrectKey"
    static var questionIndexKey = "QuestionIndexKey"
     
    static func saveState(numCorrect: Int, questionIndex: Int) {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Save the state data
        defaults.setValue(numCorrect, forKey: numCorrectKey)
        defaults.setValue(questionIndex, forKey: questionIndexKey)
        
    }
    
    static func retrieveValue(key: String) -> Any? {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey: key)
    }
    
    
    static func clearState() {
        
        // Get a reference to user defaults
        let defualts = UserDefaults.standard
        
        // Clear the state data in user defaults
        defualts.removeObject(forKey: numCorrectKey)
        defualts.removeObject(forKey: questionIndexKey)
    }
    
}
