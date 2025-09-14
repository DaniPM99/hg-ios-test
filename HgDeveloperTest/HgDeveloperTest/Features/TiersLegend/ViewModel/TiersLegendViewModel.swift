//
//  TiersLegendViewModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import Foundation

final class TiersLegendViewModel: ObservableObject {
    @Published var tier: TagType
    @Published var expireDate: String
    @Published var points: Int
    
    var tierBenefit : BenefitsTier {
        switch tier {
        case .emerald:
            return BenefitsTier.emerald
        case .gold:
            return BenefitsTier.gold
        case .silver:
            return BenefitsTier.silver
        case .bronze:
            return BenefitsTier.bronze
        }
    }
    
    init(tier: TagType, expireDate: String, points: Int) {
        self.tier = tier
        self.expireDate = expireDate
        self.points = points
    }
    
    func matchTierWithBenefit(benefit: BenefitsTier) -> TagType {
        switch benefit {
        case .emerald:
            return .emerald
        case .gold:
            return .gold
        case .silver:
            return .silver
        case .bronze:
            return .bronze
        }
    }
}
