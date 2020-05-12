//
//  ResultsTableViewController.swift
//  CovidTestKit
//
//  Created by melvin asare on 03/05/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import Foundation

import UIKit

class ResultsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    var score = ["Score: 15+", "Score: 10-14", "Score: Under 10"]
     var twoDimentionalArray = [
         ["Your Score is high, you may currently have Covid-19",
          "Take Vitamin C Tablets",
          "Eat fruits high in Vitamin C",
          "Eat plents of Oranges, Kiwi, Mangos and Pineapples"],
         
         ["Your Score is average, you may currently have been in contact with Covid-19",
          "Eat fruits high in Vitamin C",
          "Eat plents of Oranges, Kiwi, Mangos and Pineapples"],
         
         ["Your Score is relatively low, The chances of you having Covid-19 is low",
          "Eat fruits high in Vitamin C",
          "Eat plents of Oranges, Kiwi, Mangos and Pineapples",
     "Eat plents of Oranges, Kiwi, Mangos and Pineapples",
     "Eat plents of Oranges, Kiwi, Mangos and Pineapples",
     "Eat plents of Oranges, Kiwi, Mangos and Pineapples",
     "Eat plents of Oranges, Kiwi, Mangos and Pineapples",        ],
     ]
     
    var results: Results?
    private var collectResultsData = ResultsData.allResultsData()
    
    let whatWasYourScore = "What was your score?"
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collectResultsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return twoDimentionalArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ResultsTableViewCell
        cell?.label.text = twoDimentionalArray[indexPath.section][indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var vc = PreviewViewController()
//        vc.testResults = collectResultsData[indexPath.row]
//        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "label"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
    func configureUI() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(tableView)
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: cellId)
        viewWillLayoutSubviews()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Results"
        tableView.delegate = self
        tableView.dataSource = self
        print(results?.title)
        view.backgroundColor = .white
    }
}
