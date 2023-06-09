//
//  Calculator.swift
//  Money of smoke
//
//  Created by Alex on 26.04.2023.
//

import Foundation

struct Calculator {
    let cigarettePackagePrice: Double
    let cigarettesPerDay: Int
    let firstDate: Date
    let lastDate: Date
    
    var daysWithoutSmoking: Int {
        if cigarettesPerPackage == 0 || cigarettesPerDay == 0 || firstDate == lastDate {
            return 0
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: firstDate, to: lastDate)
        let days = components.day ?? 0
        return days + 1
    }
    
    var moneySaved: Double {
        let pricePerCigarette = cigarettePackagePrice / cigarettesPerPackage
        return pricePerCigarette * Double(cigarettesPerDay) * Double(daysWithoutSmoking)
    }
    
    var lifeSavedDays: Double {
        let minutesSavedPerCigarette = 11
        let lifeSavedPerDay = Double(cigarettesPerDay * minutesSavedPerCigarette)
        return lifeSavedPerDay * Double(daysWithoutSmoking) / (24 * 60)
    }
    
    var isValuesSet: Bool {
        return cigarettePackagePrice != 0 && cigarettesPerDay != 0
    }
    
    private let cigarettesPerPackage = 20.0

    static func getValues() -> Calculator {
        Calculator(cigarettePackagePrice: 0, cigarettesPerDay: 0, firstDate: Date(), lastDate: Date())
    }
}
