//
//  RewardCard.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct RewardCard: View {
    let rewardType: RewardType
    private let rewardBackgroundWidth: CGFloat = 109
    private let rewardBackgroundHeight: CGFloat = 140
    private let profileContainerOpacity: Double = 0.5
    private let SecondaryRewardBackgroundWidth: CGFloat = 140
    private let SecondaryRewardBackgroundHeight: CGFloat = 140
    
    var body: some View {
        HStack(spacing: Spacing.none) {
            ZStack {
                Rectangle()
                    .fill (rewardType.color)
                    .frame(width: rewardBackgroundWidth, height: rewardBackgroundHeight)
                    .layoutPriority(1)
                rewardType.icon
                    .resizable()
                    .frame(width: rewardType.width, height: rewardType.height)
                    .rotationEffect(.degrees(rewardType.rotation))
            }
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .background,
                                .profileContainer1.opacity(profileContainerOpacity)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: SecondaryRewardBackgroundWidth, height: SecondaryRewardBackgroundHeight)
                    .layoutPriority(1)
                VStack (alignment: .leading) {
                    Text(rewardType.title)
                        .font(.hgRewardTitle)
                        .foregroundStyle(.baseGray)
                    Spacer()
                    HgButton(
                        hgType: .noIconRedeem,
                        action: {}
                    )
                }
                .padding([.vertical, .horizontal], Spacing.md)
            }
        }
        .cornerRadius(CornerRadius.md)
    }
}

#Preview {
    RewardCard(rewardType: .juice)
}
