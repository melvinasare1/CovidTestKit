//
//  ViewController.swift
//  CovidTestKit
//
//  Created by melvin asare on 24/04/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import UIKit
// import Hue
import Lottie
import DynamicColor

class OnboardingPage: UIViewController {
    
    var lottieAnimation: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("stayhome")
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.play()
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    var stayHome: UILabel = {
        let label = UILabel()
        label.text = "Stay Home"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        return label
    }()
    
    var staySafe: UILabel = {
        let label = UILabel()
        label.text = "Stay Safe"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 45, weight: .semibold)
        return label
    }()
    
    var takeTestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Take A Test", for: .normal)
        let dynamicColor = DynamicColor(hexString: "#c0392b")
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = dynamicColor
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shouldRasterize = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(transitionToQuizpage), for: .touchUpInside)
        return button
    }()
    
    @objc func transitionToQuizpage() {
        let vc = UserInfoInput()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func lottieAnimationPosition() {
        lottieAnimation.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        lottieAnimation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        lottieAnimation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        lottieAnimation.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60).isActive = true
    }
    
    func pageTextPositions() {
        stayHome.topAnchor.constraint(equalTo: lottieAnimation.bottomAnchor, constant: 5).isActive = true
        stayHome.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        stayHome.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        stayHome.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        staySafe.topAnchor.constraint(equalTo: stayHome.bottomAnchor, constant: 0).isActive = true
        staySafe.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        staySafe.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        staySafe.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func buttonPosition() {
        takeTestButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        takeTestButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        takeTestButton.topAnchor.constraint(equalTo: staySafe.bottomAnchor, constant: 15).isActive = true
        takeTestButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(lottieAnimation)
        view.addSubview(staySafe)
        view.addSubview(stayHome)
        view.addSubview(takeTestButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
        view.backgroundColor = UIColor(red: 253/255, green: 225/255, blue: 222/255, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        lottieAnimationPosition()
        buttonPosition()
        pageTextPositions()
        
    }
    
    
}
