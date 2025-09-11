//
//  ChallengeType.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

protocol ChallengeTypeProtocol {
    var title : String { get }
    var body : String { get }
    var body2 : String { get }
    var color1: Color { get }
    var color2: Color { get }
    var rotation: Double { get }
    var icon : Image { get }
    var iconInsignia : Image { get }
    var width : CGFloat { get }
    var height : CGFloat { get }
}

enum ChallengeType: String, CaseIterable {
    case greens
    case beans
}

extension ChallengeType: ChallengeTypeProtocol {
    var width: CGFloat {
        switch self {
        case .greens:
            return 305
        case .beans:
            return 290
        }
    }
    
    var height: CGFloat {
        switch self {
        case .greens:
            return 204
        case .beans:
            return 290
        }
    }
    
    var rotation: Double {
        switch self {
        case .greens:
            return 0
        case .beans:
            return 90
        }
    }
    
    var title: String {
        switch self {
        case .greens:
            return "GREENS\nCHALLENGE"
        case .beans:
            return "BEANS\nCHALLENGE"
        }
    }
    
    var body: String {
        switch self {
        case .greens:
            return "Pide 10 Garden Bowls o Market Plates\ny te regalaremos el nº 11."
        case .beans:
            return "Pide 10 Coffees o Tés &\nte invitamos al número 11."
        }
    }
    
    var body2: String {
        switch self {
        case .greens:
            return "*(Sides no incluidos)"
        case .beans:
            return ""
        }
    }
    
    var color1: Color {
        switch self {
        case .greens:
            return .greensContainer1
        case .beans:
            return .beansContainer1
        }
    }
    
    var color2: Color {
        switch self {
        case .greens:
            return .greensContainer2
        case .beans:
            return .beansContainer2
        }
    }
    
    var icon: Image {
        switch self {
        case .greens:
            return Image("greens")
        case .beans:
            return Image("beans")
        }
    }
    
    var iconInsignia: Image {
        switch self {
        case .greens:
            return Image("greenInsignia")
        case .beans:
            return Image("beansInsignia")
        }
    }
    

}
