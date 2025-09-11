//
//  RewardCard.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct RewardCard: View {
    let rewardType: RewardType
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill (rewardType.color)
                    .frame(width: 109, height: 140)
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
                                .profileContainer1.opacity(0.5)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 131, height: 140)
                    .layoutPriority(1)
                VStack (alignment: .leading) {
                    Text(rewardType.title)
                        .font(.hgRewardTitle)
                        .foregroundStyle(.baseGray)
                    Spacer()
                    HgButton(hgType: .noIconRedeem)
                }
                .padding([.vertical, .horizontal], 16)
            }
        }
        .cornerRadius(14)
    }
}

#Preview {
    RewardCard(rewardType: .juice)
}
