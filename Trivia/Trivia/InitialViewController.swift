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

        // Do any additional setup after loading the view.
    }


    @IBAction func startTriviaTapped(_ sender: Any) {
        
        if userTextField.hasText {
            let vc = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func informationTapped(_ sender: Any) {
        let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
        present(vc, animated: true)
    }
}
