//
//  RewardType.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

protocol RewardTypeProtocol {
    var title : String { get }
    var color: Color { get }
    var icon: Image { get }
    var rotation: Double { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
}

enum RewardType: String, CaseIterable {
    case birthday
    case juice
}

extension RewardType: RewardTypeProtocol {
    var rotation: Double {
        switch self {
        case .birthday:
            return 5
        case .juice:
            return 0
        }
    }
    
    var width: CGFloat {
        switch self {
        case .birthday:
            return 68
        case .juice:
            return 103
        }
    }
    
    var height: CGFloat {
        switch self {
        case .birthday:
            return 103
        case .juice:
            return 180
        }
    }
    
    var color: Color {
        switch self {
        case .birthday:
            return .rewardsContainer1
        case .juice:
            return .rewardsContainer2
        }
    }
    
    var title : String {
        switch self {
        case .birthday:
            return "Birthday\nGift Card\n20€"
        case .juice:
            return "Get a\nFree\nJuice"
        }
    }
    
    var icon : Image {
        switch self {
        case .birthday:
            return Image("discount")
        case .juice:
            return Image("juice")
        }
    }
}
