//
//  UpperPart.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct UpperPart: View {
    let challengeType: ChallengeType
    private let upperPartHeight: CGFloat = 168
    private let upperPartIconOffset: CGFloat = -100
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
                    .frame(height: upperPartHeight)
                    .frame(maxWidth: .infinity)
                challengeType.icon
                    .resizable()
                    .rotationEffect(.degrees(challengeType.rotation))
                    .offset(y:upperPartIconOffset)
                    .frame(width: challengeType.width, height: challengeType.height)
                
                VStack(spacing: Spacing.lg) {
                    Text(challengeType.title)
                        .font(.hgChallengeTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    VStack(spacing: Spacing.sm) {
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
        .frame(height: upperPartHeight)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    UpperPart(challengeType: .beans)
}
