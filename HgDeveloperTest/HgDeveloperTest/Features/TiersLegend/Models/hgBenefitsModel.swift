//
//  hgBenefitsModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

let benefitBronzeOne = String(localized: "Greens challenge: buy 10 garden bowls\nor market plates and get one free.")
let benefitBronzeTwo = String(localized: "Refer a friend and get 3€ when they\norder for the first time using our app.")

let benefitSilverOne = String(localized: "Greens challenge: buy 10 garden bowls\nor market plates and get one free.")
let benefitSilverTwo = String(localized: "Refer a friend and get 4€ when they\norder for the first time using our app.")
let benefitSilverThree = String(localized: "5€ credit on your birthday week.")
let benefitSilverFour = String(localized: "One free sweet corner item of the\nmonth.")

let benefitGoldOne = String(localized: "Greens challenge: buy 10 garden bowls\nor market plates and get one free.")
let benefitGoldTwo = String(localized: "Refer a friend and get 6€ when they\norder for the first time using our app.")
let benefitGoldThree = String(localized: "10€ credit on your birthday week.")
let benefitGoldFour = String(localized: "One free sweet corner item of the\nmonth.")
let benefitGoldFive = String(localized: "1 chance to win one invitation to our\nrestaurant opening parties.")
let benefitGoldSix = String(localized: "1 chance to win an invitation to our\nyearly masterclass with chef Ben.")
let benefitGoldSeven = String(localized: "1 chance to win an invitation to our\nbimonthly wellness exlcusive events.")

let benefitsEmeralOne = String(localized: "Greens challenge: buy 10 garden bowls\nor market plates and get one free.")
let benefitsEmeralTwo = String(localized: "Refer a friend and get 9€ when they\norder for the first time using our app.")
let benefitsEmeralThree = String(localized: "15€ credit on your birthday week.")
let benefitsEmeralFour = String(localized: "One free sweet corner item of the\nmonth.")
let benefitsEmeralFive = String(localized: "2 chances to win one invitation to our\nrestaurant opening parties.")
let benefitsEmeralSix = String(localized: "2 chances to win an invitation to our\nyearly masterclass with chef Ben.")
let benefitsEmeralSeven = String(localized: "2 chances to win an invitation to our\nbimonthly wellness exlcusive events.")

protocol BenefitsProvider {
    var tag: String { get }
    var title: String { get }
    func body(isActive: Bool, isPreviousFromActive: Bool) -> String
    var color: Color { get }
    var benefits: [String] { get }
}

enum BenefitsTier: Int, CaseIterable {
    case bronze = 0
    case silver = 1
    case gold = 2
    case emerald = 3
}

extension BenefitsTier: BenefitsProvider {
    func body(isActive: Bool, isPreviousFromActive: Bool) -> String {
        switch self {
        case .bronze:
            return isActive ? String(localized: "XX-20 GREEN STAMPS COLLECTED") : isPreviousFromActive ? String(localized: "20-20 GREEN STAMPS COLLECTED") : ""
        case .silver:
            return isActive ? String(localized: "XX-50 GREEN STAMPS COLLECTED") : isPreviousFromActive ? String(localized: "50-50 GREEN STAMPS COLLECTED") : String(localized: "UNLOCKS AT 20 GREEN STAMPS")
        case .gold:
            return isActive ? String(localized: "XX-100 GREEN STAMPS COLLECTED") : isPreviousFromActive ? String(localized: "UNLOCKS AT 50 GREEN STAMPS") : String(localized: "UNLOCKS AT 50 GREEN STAMPS")
        case .emerald:
            return isActive ? String(localized: "100+ GREEN STAMPS COLLECTED") : isPreviousFromActive ? "" : String(localized: "UNLOCKS AT 100 GREEN STAMPS")
        }
    }
    
    var tag: String {
        switch self {
        case .bronze:
            return "Starter"
        case .silver:
            return "Champ"
        case .gold:
            return "Star"
        case .emerald:
            return "Legend"
        }
    }
    
    var title: String {
        switch self {
        case .bronze:
            return "STARTER."
        case .silver:
            return "CHAMP."
        case .gold:
            return "STAR."
        case .emerald:
            return "LEGEND."
        }
    }
    
    var color: Color {
        switch self {
        case .bronze:
            return .bronzeTier
        case .silver:
            return .silverTier
        case .gold:
            return .goldTier
        case .emerald:
            return .emeraldTier
        }
    }
    
    var benefits: [String] {
        switch self {
        case .bronze:
            return [benefitBronzeOne, benefitBronzeTwo]
        case .silver:
            return [benefitSilverOne, benefitSilverTwo, benefitSilverThree, benefitSilverFour]
        case .gold:
            return [benefitGoldOne, benefitGoldTwo, benefitGoldThree, benefitGoldFour, benefitGoldFive, benefitGoldSix, benefitGoldSeven]
        case .emerald:
            return [benefitsEmeralOne, benefitsEmeralTwo, benefitsEmeralThree, benefitsEmeralFour, benefitsEmeralFive, benefitsEmeralSix, benefitsEmeralSeven]
        }
    }
}
