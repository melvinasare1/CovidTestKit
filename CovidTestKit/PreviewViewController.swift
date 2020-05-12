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
    
    //    lazy var bulletinManager: BLTNItemManager = {
    //        let rootItem: BLTNItem = configureUI()
    //        return BLTNItemManager(rootItem: rootItem)
    //    }()
    //
    //
    //    func configureUI() -> BLTNItem {
    //        let page = BLTNPageItem(title: "Push Notifications")
    //        page.image = UIImage(named: "")
    //        page.descriptionText = "Receive push notifications when new photos of pets are available."
    //        page.actionButtonTitle = "Subscribe"
    //        page.alternativeButtonTitle = "Not now"
    //
    //        bulletinManager.showBulletin(above: self)
    //        return page
    //    }
    
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
        var button = UIButton(type: .infoLight)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        //   bulletinManager.showBulletin(above: self)
        
        view.addSubview(button)
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
    
    func tieMyShow() {
        tieMyShoe2(size: 8)
    }
    
    func tieMyShoe2(size: Int) {
  
    }
    
    func tieMyShoeAndGiveMeANewOne() -> Bool {
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
