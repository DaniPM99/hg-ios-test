//
//  HomeHeaderButtonType.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

protocol HgButtonProtocol {
    var title: String { get }
    var icon: Image? { get }
    var backgroundColor: Color { get }
    var textColor: Color { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
}

enum HgButtonType {
    case redeem
    case noIconRedeem
    case history
    case knowMore
}

extension HgButtonType: HgButtonProtocol {
    var backgroundColor: Color {
        switch self {
        case .redeem, .history, .noIconRedeem:
            return .white
        case .knowMore:
            return .black
        }
    }
    
    var textColor: Color {
        switch self {
        case .redeem, .history, .noIconRedeem:
            return .black
        case .knowMore:
            return .white
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .redeem, .history:
            return 8
        case .knowMore, .noIconRedeem:
            return 6
        }
    }
    
    var width: CGFloat {
        switch self {
        case .redeem, .history:
            return 133
        case .knowMore:
            return 75
        case .noIconRedeem:
            return 76
        }
    }
    
    var height: CGFloat {
        switch self {
        case .redeem, .history:
            return 34
        case .knowMore, .noIconRedeem:
            return 29
        }
    }
    
    var title: String {
        switch self {
        case .redeem, .noIconRedeem:
            return String(localized: "Redeem")
        case .history:
            return String(localized: "History")
        case .knowMore:
            return String(localized: "Know +")
        }
    }
    
    var icon: Image? {
        switch self {
        case .redeem:
            return Image(systemName: "sparkles")
        case .history:
            return Image(systemName: "text.document")
        case .knowMore, .noIconRedeem:
            return nil
        }
    }
}
