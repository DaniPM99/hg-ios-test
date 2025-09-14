//
//  HomeView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    var lift: CGFloat = -50
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.black)
                .frame(height: 209)
            VStack (spacing: 30) {
                HomeSectionOne()
                    .environmentObject(viewModel)
                HomeSectionTwo()
                    .environmentObject(viewModel)
                HomeSectionThree(expireDate: viewModel.expireDate)
            }
            .offset(y: lift)
            .padding(.horizontal, 32)
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
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical)
            .background(Color.black)
        }
    }
}

#Preview {
    HomeView()
}
