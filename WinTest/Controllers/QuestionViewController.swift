//
//  QuestionViewController.swift
//  TestMaket
//
//  Created by Mac on 19.07.2023.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var responsLabel: UILabel!

    @IBAction func responseButton(_ sender: Any) {
        sendQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        
        questionTextField.backgroundColor = .white
        questionTextField.placeholder = "Задай вопрос тренеру"
        questionTextField.layer.cornerRadius = 12

    }
    
    func sendQuestion() {
        guard let question = questionTextField.text else { return }
        let manager = NetworkManager()
        let questionID = manager.generateID()
        responsLabel.text = "Ответ обрабатывается"
        
        manager.sendQuestion(question: question, id: questionID) {[weak self] _ in
            guard let self = self else { return }

        }
        
        manager.getResponse(id: questionID) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.responsLabel.text = response.response
            }
        }
                
        
        
    }

}
