//
//  HomeHeader.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .background,
                            .profileContainer1
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 187)
                .frame(maxWidth: .infinity)
                .cornerRadius(14)
            VStack {
                ZStack(alignment: .center) {
                    TierTag(tagStyle: .bronze, tierActive: false)
                        .offset(x:90)
                    AvatarView()
                }
                VStack (spacing: 16) {
                    Text("ARTURO CASAS")
                        .font(.hgTitle)
                    HStack {
                        Image(systemName: "gift")
                            .opacity(0.5)
                        Text("5,40 €")
                            .opacity(0.5)
                            .bold()
                        Text("· Joined Sep. 2021")
                            .opacity(0.5)
                    }
                    HStack (spacing: 16) {
                        HgButton(
                            hgType: .redeem,
                            action: {}
                        )
                        HgButton(
                            hgType: .history,
                            action: {}
                        )
                    }
                }
            }
            .offset(y:-40)
        }
    }
}

#Preview {
    HomeHeader()
}
