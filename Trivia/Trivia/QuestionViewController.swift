//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 21/06/22.
//

import UIKit
import Alamofire

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    public var categorieId: Int?
    
    private var questions = Conteudo.shared.obterPerguntas()
    private var currentQuestionIndex = 0
    private var score = 0

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        setCurrentQuestion(for: currentQuestionIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let tabBar = tabBarController,
              let categorie = categorieId else { return }
        
        if tabBar.selectedIndex == 0 {
            selectCategorie()
            setCurrentQuestion(for: currentQuestionIndex)
            print(categorie)
        }
    }

    
    @IBAction func rightAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: true)
        sendResultMessage(for: result)
        if result { score += 10 }
    }
    
    @IBAction func wrongAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: false)
        sendResultMessage(for: result)
        if result { score += 10 }
    }
    
    private func selectCategorie() {
        questions = questions.filter({$0.category == categorieId})
        
    }
    
    private func updateQuestion() {
        currentQuestionIndex += 1
        setCurrentQuestion(for: currentQuestionIndex)
    }
    
    private func setCurrentQuestion(for index: Int) {
        if index >= questions.count {
            rightButton.isEnabled = false
            wrongButton.isEnabled = false
            
            let title = "Você fez \(score) pontos!"
            let message = "Deseja começar o jogo novamente?"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: {[self] _ in
                currentQuestionIndex = 0
                score = 0
                setCurrentQuestion(for: 0)
                rightButton.isEnabled = true
                wrongButton.isEnabled = true
            }))
            alert.addAction(UIAlertAction(title: "Não", style: .default, handler: {[self] _ in
                navigationController?.popViewController(animated: true)
            }))
            
            present(alert, animated: true)
        } else {
            questionLabel.text = questions[index].question
        }
    }
    
    private func validateCurrentQuestion(answer: Bool) -> Bool {
        questions[currentQuestionIndex].answer == answer
    }
    
    private func sendResultMessage(for result: Bool) {
        let message = result ? "A resposta é correta!" : "A resposta é errada!"
        
        let alert = UIAlertController(title: "Resposta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.updateQuestion()}))
        self.present(alert, animated: true)
    }
    
    func getQuestions() {
        let categoriesURL = "https://opentdb.com/api_category.php"
        
//        AF.request(categoriesURL)
//            .responseDecodable(of: CategoryResponse.self) { data in
//                switch data.result {
//                case .success(let categoryResponse):
//                    //questions = categoryResponse.categories.sorted()
//                case .failure(let error):
//                    print(error)
//                }
//            }
    }
}
