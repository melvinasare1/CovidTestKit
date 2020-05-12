//
//  TabBarController.swift
//  CovidTestKit
//
//  Created by melvin asare on 03/05/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageOne = QuestionPage()
        let pageTwo = ResultsTableViewController()
    
        pageOne.tabBarItem = UITabBarItem(title: "Test", image: UIImage(named:"Quiz"), tag: 0)
        pageTwo.tabBarItem = UITabBarItem(title: "Tips", image: UIImage(named:"Tips"), tag: 1)

        let tabBarList = [pageOne, pageTwo]
        
        viewControllers = tabBarList
    
    }
}
