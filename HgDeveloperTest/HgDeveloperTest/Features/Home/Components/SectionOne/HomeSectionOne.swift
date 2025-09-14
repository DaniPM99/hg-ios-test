//
//  HomeSectionOne.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeSectionOne: View {
    var reservedTop: CGFloat = -40
    var reservedLeft: CGFloat = 85
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        card
    }

    private var card: some View {
        VStack(spacing: 30) {
            HomeHeader()
                .environmentObject(viewModel)
            TierComponent()
                .environmentObject(viewModel)
            Divider()
            RewardsView()
        }
        .padding(.bottom, 30)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.06), radius: 8, y: 2)
                .cornerRadius(14)
        )
        .overlay(alignment: .top) {
            TierTag(
                tagStyle: viewModel.tier,
                tierActive: false,
                isAnimated: true)
                .offset(x: reservedLeft,y:reservedTop)
            AvatarView()
                .offset(y:reservedTop)
        }
    }
}

#Preview {
    HomeSectionOne()
        .environmentObject(HomeViewModel())
        .background(.black)
}
