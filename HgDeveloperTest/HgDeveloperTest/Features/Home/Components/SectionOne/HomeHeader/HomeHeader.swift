//
//  HomeHeader.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HomeHeader: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
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
                VStack (spacing: 16) {
                    Text(viewModel.userName)
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
                .padding(.top, 55)
        }
    }
}

#Preview {
    HomeHeader()
        .environmentObject(HomeViewModel())
}
