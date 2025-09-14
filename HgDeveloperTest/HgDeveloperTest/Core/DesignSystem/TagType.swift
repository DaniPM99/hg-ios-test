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
    var tierTitle: String { get }
    var tierSubtitle: String { get }
    var numberOfStars: Int { get }
    var videoTitle: String { get }
}

enum TagType {
    case bronze
    case silver
    case gold
    case emerald
}

extension TagType: TagStyleProtocol {
    var tierSubtitle: String {
        switch self {
        case .bronze:
            String(localized: "Say hello to our new loyalty\nprogram; Honest People.")
        case .silver:
            String(localized: "You’ve gone all in on real food.\nYou’re now a Champ.")
        case .gold:
            String(localized: "You’re a real food addict and\ndeserve to be crowned a Star.")
        case .emerald:
            String(localized: "You’re eating Honest Greens morning,\nevening, and night. You’re legendary.")
        }
    }
    
    var tierTitle: String {
        switch self {
        case .bronze:
            String(localized: "WELCOME\nSTARTER.")
        case .silver:
            String(localized: "CHAMP\nUNLOCKED.")
        case .gold:
            String(localized: "STAR\nUNLOCKED.")
        case .emerald:
            String(localized: "LEGEND\nUNLOCKED.")
        }
    }
    
    var numberOfStars: Int {
        switch self {
        case .bronze:
            1
        case .silver:
            2
        case .gold:
            3
        case .emerald:
            4
        }
    }
    
    var videoTitle: String {
        switch self {
        case .bronze:
            "starterLoop"
        case .silver:
            "champLoop"
        case .gold:
            "starLoop"
        case .emerald:
            "legendLoop"
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
    
    func title(tierActive: Bool) -> String {
        if tierActive {
            return String(localized: "Your Tier")
        } else {
            switch self {
            case .bronze:
                return String(localized: "Starter")
            case .silver:
                return String(localized: "Champ")
            case .gold:
                return String(localized: "Star")
            case .emerald:
                return String(localized: "Legend")
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
