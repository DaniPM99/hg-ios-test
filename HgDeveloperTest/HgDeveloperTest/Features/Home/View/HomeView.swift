//
//  HomeView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Color.black
                        .frame(height: 189)
                    Color.background
                }
                VStack {
                    Header(
                        title: "Hones greens",
                        backButton: true,
                        closeButton: false,
                        dismiss: dismiss
                    )
                    VStack {
                        HomeSectionOne()
                            .padding(Spacing.md)
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
                    .padding(.top, 39)
                }
                .padding(.top, 60)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
