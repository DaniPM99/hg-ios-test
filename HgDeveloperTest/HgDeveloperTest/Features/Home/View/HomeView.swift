//
//  HomeView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(.black)
                        .frame(width: .infinity, height: 142)
                    Header(
                        title: "Honest People",
                        backButton: true,
                        closeButton: false
                    )
                        .padding(8)
                }
                VStack {
                    HomeSectionOne()
                        .padding(16)
                    ForEach(ChallengeType.allCases, id: \.self) { item in
                        HomeChallengeCard(challengeType: item)
                    }
                    Divider()
                        .tint(.black)
                    HStack {
                        Image("calendar")
                            .tint(.disabled)
                        Text("Tus sellos caducan el 01/06/2023.\nTu tier se resetea el 01/01/2024.")
                            .foregroundStyle(.disabled)
                    }
                }
                .offset(y:-55)
            }
            .background(Color.background)
        }
    }
}

#Preview {
    HomeView()
}
