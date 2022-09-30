//
//  ContentViewModel.swift
//  BMI Calculator SwiftUI
//
//  Created by Kristanto Sean N on 30/09/22.
//

import Foundation

class ContentViewModel : ObservableObject {
    
    @Published var ageFieldIndex = 0
    
    @Published var genderFieldIndex = ""
    
    @Published var heightField = ""
    @Published var weightField = ""
    
    @Published var resultTitle = ""
    @Published var resultDescription = ""

    func doCalculate() {        
        guard let weight = Double(weightField), let height = Double(heightField) else {
            return
        }
        
        let bmi = weight / (height/100 * height/100)
        
        var result = ""
        switch (bmi) {
            case 0...16:
                result = "Based on your BMI value, you are severely underweight and need to gain \(calculateWeightAdjustment(normalBMI: 18.5, weight: weight, height: height)) kg"
            case 16...17:
                result = "Based on your BMI value, you are moderately underweight and need to gain \(calculateWeightAdjustment(normalBMI: 18.5, weight: weight, height: height)) kg"
            case 17...18.5:
                result = "Based on your BMI value, you are underweight and need to gain \(calculateWeightAdjustment(normalBMI: 18.5, weight: weight, height: height)) kg"
            case 18.5...25:
                result = "Your BMI is normal"
            case 25...30:
                result = "Based on your BMI value, you are overweight and need to lose \(calculateWeightAdjustment(normalBMI: 25, weight: weight, height: height)) kg"
            case 30...35:
                result = "Based on your BMI value, you have Class I Obesity and need to lose \(calculateWeightAdjustment(normalBMI: 25, weight: weight, height: height)) kg"
            case 35...40:
                result = "Based on your BMI value, you have Class II Obesity and need to lose \(calculateWeightAdjustment(normalBMI: 25, weight: weight, height: height)) kg"
            case 40...100:
                result = "Based on your BMI value, you have Class III Obesity and need to lose \(calculateWeightAdjustment(normalBMI: 25, weight: weight, height: height)) kg"
            default:
                result = "Not Found!"
        }
        resultTitle = "Your BMI Index is \(bmi.rounded(toPlaces: 2)) kg/m2"
        resultDescription = result
        
    }
    
    
    
    
    func calculateWeightAdjustment(normalBMI: Double, weight: Double, height: Double) -> Double {
        let idealWeight = normalBMI * (height/100 * height/100)
        return abs(weight - idealWeight).rounded(toPlaces: 2)
    }
}
