//
//  QuestionViewController.swift
//  TestMaket
//
//  Created by Mac on 19.07.2023.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBAction func sendButton(_ sender: Any) {
        sendQuestion()
    }
    
    @IBOutlet weak var subtitileLabel: UILabel!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        
        titleLabel.text = "ВОПРОС ТРЕНЕРУ"
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        
        questionTextField.backgroundColor = .white
        questionTextField.placeholder = "Задай вопрос тренеру"
        questionTextField.layer.cornerRadius = 12
        
        subtitileLabel.text = "История ответов"
        subtitileLabel.backgroundColor = .clear
        subtitileLabel.textColor = .white
    
    }
    
    func sendQuestion() {
        guard let question = questionTextField.text else { return }
        let manager = NetworkManager()
        let questionID = manager.generateID()
        responseLabel.text = "Ответ обрабатывается"
        
        manager.sendQuestion(question: question, id: questionID) {[weak self] _ in
            guard let self = self else { return }

        }
        
        manager.getResponse(id: questionID) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.responseLabel.text = response.response
            }
        }
                
        
        
    }

}
