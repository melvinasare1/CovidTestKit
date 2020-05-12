//
//  ResultsData.swift
//  CovidTestKit
//
//  Created by melvin asare on 03/05/2020.
//  Copyright © 2020 melvin asare. All rights reserved.
//

import Foundation
import UIKit

class ResultsData: NSObject {
    
    class func allResultsData() -> [Results] {
        var resultsData = [Results]()
        
        resultsData.append(Results(title: "Score: 15+", remedy: [
            Remedy(summaryOfCondition: "Your Score is high, you may currently have Covid-19", remedy: ["Take Vitamin C Tables", "Eat fruits high in Vitamin C", "Eat plents of Oranges, Kiwi, Mangos and Pineapples"])]))
        
        resultsData.append(Results(title: "Score: 10-15", remedy: [
            Remedy(summaryOfCondition: "Your Score is average, you may currently have been in contact with Covid-19", remedy: ["Take Vitamin C Tables", "Eat fruits high in Vitamin C", "Eat plents of Oranges, Kiwi, Mangos and Pineapples"])]))
        
        resultsData.append(Results(title: "Score: 10-", remedy: [
            Remedy(summaryOfCondition: "Your Score is relatively low, The chances of you having Covid-19 is low however we recommend taking some steps to boost your immune system", remedy: ["Take Vitamin C Tables", "Eat fruits high in Vitamin C", "Eat plents of Oranges, Kiwi, Mangos and Pineapples"])]))
        
        return resultsData
    }
}
