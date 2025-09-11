//
//  TiersView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct TiersView: View {
    var body: some View {
        VStack {
            Header(
                title: "",
                backButton: false,
                closeButton: true
            )
            Spacer()
            VStack (spacing: 32) {
                TierTag(
                    tagStyle: .silver,
                    tierActive: false
                )
                Text("WELCOME\nSTARTER.")
                    .font(.hgTierTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                HStack {
                    Image(systemName: "sparkle")
                        .foregroundStyle(.white)
                    Image(systemName: "sparkle")
                        .foregroundStyle(.terracota)
                    Image(systemName: "sparkle")
                        .foregroundStyle(.terracota)
                    Image(systemName: "lock.fill")
                        .foregroundStyle(.terracota)
                }
                Text("Say hello to our new loyalty\nprogram; Honest People.")
                    .font(.hgRewardTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                HgTierButton()
            }
        }
        .padding(32)
        .frame(width: .infinity, height: .infinity)
        .background(
        Image("starBackground")
            .resizable()
        )
    }
}

#Preview {
    TiersView()
}
