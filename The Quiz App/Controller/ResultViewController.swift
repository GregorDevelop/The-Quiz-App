//
//  ResultViewController.swift
//  The Quiz App
//
//  Created by Gregor Kramer on 25.02.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var titleText = ""
    var feedbackText = ""
    var buttonText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Now that the elements have loaded, set the text
        titleLabel.text = titleText
        feedbackLabel.text = feedbackText
        dismissButton.setTitle(buttonText, for: .normal)
        
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        
        // Dismiss the popup
        dismiss(animated: true, completion: nil)
    }
    


}
