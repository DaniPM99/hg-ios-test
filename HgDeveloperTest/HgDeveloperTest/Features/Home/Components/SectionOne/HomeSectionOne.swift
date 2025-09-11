//
//  HomeSectionOne.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeSectionOne: View {
    var body: some View {
        VStack(spacing: 20) {
            HomeHeader()
            TierComponent()
            Divider()
            RewardsView()
        }
        .background(.white)
    }
}

#Preview {
    HomeSectionOne()
        .background(.black)
}
