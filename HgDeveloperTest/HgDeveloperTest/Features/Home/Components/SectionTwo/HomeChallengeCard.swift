//
//  HomeChallengeCard.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeChallengeCard: View {
    let challengeType: ChallengeType
    var insignias: Int {
        if challengeType == .greens {
            Int(viewModel.greenInsignias)
        } else {
            Int(viewModel.beansInsignias)
        }
    }
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing:0) {
                UpperPart(challengeType: challengeType)
                LowerPart(insignias: insignias, challengeType: challengeType)
            }
            InsigniaRecount(insignias: insignias)
        }
        .cornerRadius(14)
        .frame(height: 335)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeChallengeCard(challengeType: .greens)
}
