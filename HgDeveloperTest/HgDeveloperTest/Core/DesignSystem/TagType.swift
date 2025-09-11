//
//  TagType.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

protocol TagStyleProtocol {
    func title(tierActive: Bool) -> String
    var color: Color { get }
    func icon(tierActive: Bool) -> Image
}

enum TagType {
    case bronze
    case silver
    case gold
    case emerald
}

extension TagType: TagStyleProtocol {
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
    
    func title(tierActive: Bool) -> String {
        if tierActive {
            return "Your Tier"
        } else {
            switch self {
            case .bronze:
                return "Starter"
            case .silver:
                return "Silver"
            case .gold:
                return "Gold"
            case .emerald:
                return "Emerald"
            }
        }
    }
    
    func icon(tierActive: Bool) -> Image {
        if tierActive {
            return Image(systemName: "hand.thumbsup.fill")
        } else {
            return Image(systemName: "checkmark.seal.fill")
        }
    }
}
