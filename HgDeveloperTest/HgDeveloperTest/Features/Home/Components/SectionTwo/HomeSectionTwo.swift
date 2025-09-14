//
//  HomeSectionTwo.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

struct HomeSectionTwo: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(ChallengeType.allCases, id: \.self) { item in
                HomeChallengeCard(challengeType: item)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    let viewModel = HomeViewModel()
    HomeSectionTwo()
        .environmentObject(viewModel)
}
