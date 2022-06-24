//
//  InitialViewController.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 14/06/22.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
            view.endEditing(true)
    }

    @IBAction func startTriviaTapped(_ sender: Any) {
        if userTextField.hasText {
            presentTabBarController()
        }
    }
    
    @IBAction func informationTapped(_ sender: Any) {
        let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
        present(vc, animated: true)
    }
    
    private func presentTabBarController() {
        let tabBarController = TabBarViewController()
        
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }
}
