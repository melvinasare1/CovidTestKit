//
//  QuestionsPage.swift
//  CovidTestKit
//
//  Created by melvin asare on 24/04/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import BLTNBoard

class QuestionPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellId = "cellId"
    private var collectQuestionArray = QuestionData.allQuestionDataArray()
    var currentQuestionNumber: Question?
    var questionArray = [Question]()
    var score = 0
    let tableView = UITableView()
    
    
    
    
    
//    lazy var bulletinBoard: BLTNItemManager = {
//        let rootItem: BLTNItem = QuestionPage()
//        return BLTNItemManager(rootItem: rootItem)
//    }()
//    
    var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var lottieAnimation: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("thinkagain")
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.play()
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    var questionlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .blue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    func topBottomView() {
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func lottieAnimationPosition() {
        lottieAnimation.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        lottieAnimation.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        lottieAnimation.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0).isActive = true
        lottieAnimation.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
    }
    
    func elementsPosition() {
        questionlabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0).isActive = true
        questionlabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0).isActive = true
        questionlabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
        questionlabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func tableViewPosition() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: questionlabel.bottomAnchor, constant: 30).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        // tableView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10).isActive = true
    }
    
    func checkoutAnswer(question: Question, answer: Answer) -> Bool {
        if question.answer.contains(where: { $0.text == answer.text }) && answer.goodAnswer == true {
            score+=2
            return true
        } else if question.answer.contains(where: { $0.text == answer.text }) && answer.badAnswer == true {
            score+=4
            return true
        } else {
            score+=1
            return question.answer.contains(where: { $0.text == answer.text }) && answer.neutralAnswer == true
        }
    }
    
    func configureUI(question: Question) {
        questionlabel.text = question.text
        currentQuestionNumber = question
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestionNumber?.answer.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = currentQuestionNumber?.answer[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currentQuestionNumber else { return }
        let answer = question.answer[indexPath.row]
        
        if checkoutAnswer(question: question, answer: answer) {
            if let index = collectQuestionArray.firstIndex(where: { $0.text == question.text }) {
                if index < (collectQuestionArray.count - 1) {
                    let nextQuestion = collectQuestionArray[index+1]
                    print(score)
                    configureUI(question: nextQuestion)
                } else {
                    createMyAlert(title: "Score", message: "Your current score is \(score)")
                }
            }
        }
    }
    
    func transitionToResultsPage() {
        let vc = PreviewViewController()
        present(vc, animated: true, completion: nil)
    }
    
    func createMyAlert(title: String, message: String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let myAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            self.transitionToResultsPage()
        }
        myAlert.addAction(myAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(topView)
        view.addSubview(bottomView)
        view.addSubview(lottieAnimation)
        
        view.addSubview(tableView)
        view.addSubview(questionlabel)
        view.sendSubviewToBack(bottomView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
        configureUI(question: collectQuestionArray.first!)
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        topBottomView()
        lottieAnimationPosition()
        tableViewPosition()
        elementsPosition()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
