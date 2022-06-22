//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 21/06/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    var categories: [Category] = [
        Category(id: 1, name: "Futebol"),
        Category(id: 2, name:"Geografia"),
        Category(id: 3, name:"Conhecimentos Gerais")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        closeButton.tintColor = .black
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()
    }
    
    private func getCategories() {
        tableView.reloadData()
    }
    
    
    @IBAction func didCloseTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row].id
        
        let vc = QuestionViewController()
        vc.categorieId = category
        navigationController?.pushViewController(vc, animated: true)
    }
}
