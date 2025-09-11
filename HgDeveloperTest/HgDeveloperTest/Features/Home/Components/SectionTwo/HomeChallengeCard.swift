//
//  HomeChallengeCard.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeChallengeCard: View {
    let insignias: Int = 0
    let challengeType: ChallengeType
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                UpperPart(challengeType: challengeType)
                LowerPart(insignias: insignias, challengeType: challengeType)
            }
            InsigniaRecount(insignias: insignias)
        }
        .frame(width: 339, height: 335)
        .cornerRadius(14)
    }
}

#Preview {
    HomeChallengeCard(challengeType: .greens)
}
