//
//  UserInfoInput.swift
//  CovidTestKit
//
//  Created by melvin asare on 24/04/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import Foundation
import UIKit
import DynamicColor
import FirebaseAuth
import Lottie

class UserInfoInput: UIViewController {
    
    var lottieAnimation: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("registration")
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.play()
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    var userName: UITextField = {
        let label = UITextField()
        label.placeholder = "Please Enter Your Name"
        label.backgroundColor = .lightGray
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userTelephoneNumber: UITextField = {
        let label = UITextField()
        label.placeholder = "Enter Number +44"
        label.textAlignment = .center
        label.textColor = .white
        label.keyboardType = .numberPad
        label.layer.cornerRadius = 12
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var verificationCode: UITextField = {
        let label = UITextField()
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.placeholder = "Enter Your verification code"
        label.layer.cornerRadius = 12
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userDefeaults = UserDefaults.standard
    
    var proceedToQuizPage: UIButton = {
         let button = UIButton()
         button.setTitle("Submit", for: .normal)
         let dynamicColor = DynamicColor(hexString: "#c0392b")
         button.setTitleColor(.white, for: .normal)
         button.backgroundColor = dynamicColor
         button.layer.cornerRadius = 12
         button.layer.masksToBounds = true
         button.layer.shadowColor = UIColor.black.cgColor
         button.layer.shadowRadius = 5
         button.layer.shadowOpacity = 0.2
         button.layer.shadowOffset = CGSize(width: 1, height: 2)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(oneTimePasscode), for: .touchUpInside)
         return button
     }()
    
    var requestVerificationCode: UIButton = {
        let button = UIButton()
        button.setTitle("Request Code", for: .normal)
        let dynamicColor = DynamicColor(hexString: "#c0392b")
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = dynamicColor
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 1, height: 2)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(requestVerificationPressed), for: .touchUpInside)
        return button
    }()
    
    var verificationId: String?
    
    @objc func requestVerificationPressed() {
        guard let userNumber = userTelephoneNumber.text else { return }
        if verificationCode.isHidden == true {
            PhoneAuthProvider.provider().verifyPhoneNumber(userNumber, uiDelegate: nil) { (verificationId, error) in
                if error == nil {
                    print("work")
                    print(verificationId)
                    guard let veryId = verificationId else { return }
                    self.userDefeaults.set(veryId, forKey: "verificationId")
                    self.userDefeaults.synchronize()
                    
                    self.verificationCode.isHidden = false
                    self.requestVerificationCode.isHidden = true
                    self.proceedToQuizPage.isHidden = false
                    self.userName.isHidden = true
                    self.userTelephoneNumber.isHidden = true
                } else {
                    print("didnt work")
                }
            }
        }
    }
    
    @objc func oneTimePasscode() {
        guard let otp = verificationCode.text else { return }
        guard let verificationID = userDefeaults.string(forKey: "verificationId") else { return }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: otp)
        
        Auth.auth().signIn(with: credential) { (success, error) in
            if error == nil {
                self.transitionToQuizPage()
            } else {
                self.createMyAlert(title: "Error", message: "Couldnt log in")
            }
        }
        
    }
    
    func transitionToQuizPage() {
        let vc = QuestionPage()
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func createMyAlert(title: String, message: String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let myAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            
        }
        myAlert.addAction(myAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(userName)
        view.addSubview(verificationCode)
        view.addSubview(userTelephoneNumber)
        view.addSubview(requestVerificationCode)
        view.addSubview(lottieAnimation)
        view.addSubview(proceedToQuizPage)
    }
    
    func lottieAnimationPosition() {
        lottieAnimation.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        lottieAnimation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        lottieAnimation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        lottieAnimation.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60).isActive = true
    }
    
    func positionOfElementsOnPage() {
        
        userName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        userName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        userName.topAnchor.constraint(equalTo: lottieAnimation.bottomAnchor, constant: 5).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        userTelephoneNumber.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0).isActive = true
        userTelephoneNumber.trailingAnchor.constraint(equalTo: userName.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        userTelephoneNumber.topAnchor.constraint(equalTo: userName.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        userTelephoneNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        verificationCode.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0).isActive = true
        verificationCode.trailingAnchor.constraint(equalTo: userName.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        verificationCode.topAnchor.constraint(equalTo: userTelephoneNumber.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        verificationCode.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        requestVerificationCode.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0).isActive = true
        requestVerificationCode.trailingAnchor.constraint(equalTo: userName.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        requestVerificationCode.topAnchor.constraint(equalTo: verificationCode.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        requestVerificationCode.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        proceedToQuizPage.leadingAnchor.constraint(equalTo: userName.leadingAnchor, constant: 0).isActive = true
         proceedToQuizPage.trailingAnchor.constraint(equalTo: userName.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
         proceedToQuizPage.topAnchor.constraint(equalTo: verificationCode.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
         proceedToQuizPage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = ""
        positionOfElementsOnPage()
        lottieAnimationPosition()
        verificationCode.isHidden = true
        proceedToQuizPage.isHidden = true
    }
}
