//
//  HomeView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    var lift: CGFloat = -50
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    private let blackBackgroundHeight: CGFloat = 209
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.black)
                .frame(height: blackBackgroundHeight)
            VStack (spacing: Spacing.xl) {
                HomeSectionOne()
                    .environmentObject(viewModel)
                HomeSectionTwo()
                    .environmentObject(viewModel)
                HomeSectionThree(expireDate: viewModel.dateFormatter.string(from: viewModel.expireDate))
            }
            .offset(y: lift)
            .padding(.horizontal, Spacing.xl)
        }
        .background(
            Color.background
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .safeAreaInset(edge: .top) {
            Header(
                title: "Honest People",
                backButton: true,
                closeButton: false,
                dismiss: dismiss
            )
            .background(Color.black)
        }
    }
}

#Preview {
    HomeView()
}
