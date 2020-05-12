//
//  QuestionData.swift
//  CovidTestKit
//
//  Created by melvin asare on 24/04/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import UIKit

class QuestionData: NSObject {

    class func allQuestionDataArray() -> [Question] {
        var questionArray = [Question]()
        
        questionArray.append(Question(text: "Have you had a fever?", answer:
            [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
             Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
             Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
        questionArray.append(Question(text: "Have you had a dry cough?", answer:
                  [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                   Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                   Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
         questionArray.append(Question(text: "How have your energy levels been?", answer:
                   [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                    Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                    Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
         questionArray.append(Question(text: "Have you had a shortness of breath?", answer:
                   [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                    Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                    Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
        questionArray.append(Question(text: "Have you had aching muscles or joints", answer:
                  [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                   Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                   Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
        questionArray.append(Question(text: "Have you had a blocked nose?", answer:
                  [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                   Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                   Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))
        
        questionArray.append(Question(text: "Have you coughed any blood?", answer:
                  [Answer(text: "Yes I have", goodAnswer: false, badAnswer: true, neutralAnswer: false),
                   Answer(text: "No I haven't", goodAnswer: true, badAnswer: false, neutralAnswer: false),
                   Answer(text: "Not really to sure", goodAnswer: false, badAnswer: false, neutralAnswer: true)]))

        return questionArray
    }
}
