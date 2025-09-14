//
//  HomeHeader.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeHeader: View {
    @EnvironmentObject var viewModel: HomeViewModel
    private let backgroundHeight: CGFloat = 187
    private let subtitleTextOpacity: Double = 0.5
    
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
                .frame(height: backgroundHeight)
                .frame(maxWidth: .infinity)
                .cornerRadius(CornerRadius.md)
            VStack (spacing: Spacing.md) {
                    Text(viewModel.userName)
                        .font(.hgTitle)
                    HStack {
                        Image(systemName: "gift")
                            .opacity(subtitleTextOpacity)
                        Text("5,40 €")
                            .opacity(subtitleTextOpacity)
                            .bold()
                        Text("· Joined Sep. 2021")
                            .opacity(subtitleTextOpacity)
                    }
                    HStack (spacing: Spacing.md) {
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
                .padding(.top, Spacing.xxxl)
        }
    }
}

#Preview {
    HomeHeader()
        .environmentObject(HomeViewModel())
}
