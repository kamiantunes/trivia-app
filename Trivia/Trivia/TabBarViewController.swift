//
//  TabBarViewController.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 22/06/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    func setupViewControllers() {
        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        
        let firstTab = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTab.title = firstTabTitle
        
        let firstNavigationViewController = UINavigationController(rootViewController: firstTab)
        firstNavigationViewController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: firstTabImage)
        
        viewControllers = [firstNavigationViewController]
        
        let secondTabTitle = "Random"
        let secondTabImage = UIImage(systemName: "shuffle")
        
        let secondTab = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        secondTab.title = secondTabTitle
        
        let secondNavigationViewController = UINavigationController(rootViewController: secondTab)
        secondNavigationViewController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: secondTabImage)
        
        viewControllers?.append(secondNavigationViewController)
    }

}
