//
//  UpperPart.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct UpperPart: View {
    let challengeType: ChallengeType
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                challengeType.color2.opacity(0.7),
                                challengeType.color1
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 168)
                    .frame(maxWidth: .infinity)
                challengeType.icon
                    .resizable()
                    .rotationEffect(.degrees(challengeType.rotation))
                    .offset(y:-100)
                    .frame(width: challengeType.width, height: challengeType.height)

                VStack(spacing: 24) {
                    Text(challengeType.title)
                        .font(.hgChallengeTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    VStack(spacing: 8) {
                        Text(challengeType.body)
                            .font(.hgBody)
                            .multilineTextAlignment(.center)
                        Text(challengeType.body2)
                            .font(.hgChallengeInfo)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .frame(height: 168)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    UpperPart(challengeType: .beans)
}
