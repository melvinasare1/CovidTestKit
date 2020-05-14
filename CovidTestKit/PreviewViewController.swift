//
//  PreviewViewController.swift
//  CovidTestKit
//
//  Created by melvin asare on 06/05/2020.
//  Copyright © 2020 melvin asare. All rights reserved.

import UIKit
import BLTNBoard
import CollapsibleTableSectionViewController

class PreviewViewController: CollapsibleTableSectionViewController {
    
    private let tableViewData = ResultsData.allResultsData()
    
    var twoDimentionalArray = [
        ["Your Score is high, you may currently have Covid-19",
         "Take Vitamin C Tablets",
         "Eat fruits high in Vitamin C",
         "Fruits to eat:",
         "Oranges",
         "Kiwi",
         "Mangos",
         "Pineapples"],
        
        ["Your Score is average, you may currently have been in contact with Covid-19",
         "Eat fruits high in Vitamin C",
         "Eat plents of Oranges, Kiwi, Mangos and Pineapples"],
        
        ["Your Score is relatively low, The chances of you having Covid-19 is low",
         "Eat fruits high in Vitamin C",
         "Eat plenty of fruits",
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.delegate = self
        //   bulletinManager.showBulletin(above: self)
    }
}


extension PreviewViewController: CollapsibleTableSectionDelegate {
    func numberOfSections(_ tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimentionalArray[section].count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ResultsTableViewCell? ?? ResultsTableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.label.text = twoDimentionalArray[indexPath.section][indexPath.row]
        return cell
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
  
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Score: Over 18+"
        } else if section == 1 {
            return "Score: Between 10 - 18"
        }  else {
            return "Score: Under 10"
        }
        //        return String(section)
    }
}
