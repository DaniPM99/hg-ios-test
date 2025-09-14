//
//  hgBenefitsModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

let benefitBronzeOne = "Greens challenge: buy 10 garden bowls\nor market plates and get one free."
let benefitBronzeTwo = "Refer a friend and get 3€ when they\norder for the first time using our app."

let benefitSilverOne = "Greens challenge: buy 10 garden bowls\nor market plates and get one free."
let benefitSilverTwo = "Refer a friend and get 4€ when they\norder for the first time using our app."
let benefitSilverThree = "5€ credit on your birthday week."
let benefitSilverFour = "One free sweet corner item of the\nmonth."

let benefitGoldOne = "Greens challenge: buy 10 garden bowls\nor market plates and get one free."
let benefitGoldTwo = "Refer a friend and get 6€ when they\norder for the first time using our app."
let benefitGoldThree = "10€ credit on your birthday week."
let benefitGoldFour = "One free sweet corner item of the\nmonth."
let benefitGoldFive = "1 chance to win one invitation to our\nrestaurant opening parties."
let benefitGoldSix = "1 chance to win an invitation to our\nyearly masterclass with chef Ben."
let benefitGoldSeven = "1 chance to win an invitation to our\nbimonthly wellness exlcusive events."

let benefitsEmeralOne = "Greens challenge: buy 10 garden bowls\nor market plates and get one free."
let benefitsEmeralTwo = "Refer a friend and get 9€ when they\norder for the first time using our app."
let benefitsEmeralThree = "15€ credit on your birthday week."
let benefitsEmeralFour = "One free sweet corner item of the\nmonth."
let benefitsEmeralFive = "2 chances to win one invitation to our\nrestaurant opening parties."
let benefitsEmeralSix = "2 chances to win an invitation to our\nyearly masterclass with chef Ben."
let benefitsEmeralSeven = "2 chances to win an invitation to our\nbimonthly wellness exlcusive events."

protocol BenefitsProvider {
    var tag: String { get }
    var title: String { get }
    var body: String { get }
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
    
    var body: String {
        switch self {
        case .bronze:
            return "20-20 GREEN STAMPS COLLECTED"
        case .silver:
            return "XX-50 GREEN STAMPS COLLECTED"
        case .gold:
            return "UNLOCKS AT 50 GREEN STAMPS"
        case .emerald:
            return "UNLOCKS AT 100 GREEN STAMPS"
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
