//
//  TierComponent.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct TierComponent: View {
    @State private var showingSheet = false
    let points: Float = 100
    var body: some View {
        VStack (spacing: 16) {
            VStack(alignment: .leading,spacing: 8) {
                HStack {
                    Text("YOU'RE A LEGEND.")
                        .font(.hgTitle)
                    Spacer()
                    HgButton(
                        hgType: .knowMore,
                        action: {
                            showingSheet.toggle()
                        }
                    )
                }
                HStack (spacing: 3) {
                    Text("You have")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                    Text("100")
                    .font(.hgBody)
                    .foregroundStyle(.baseGray)
                    Text("green stamps.")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
                }
                Text("You’re real honest people!")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, Spacing.sm)
            HgProgressView(points: 25)
        }
        .padding(.horizontal, Spacing.xl)
        .sheet(isPresented: $showingSheet) {
            TiersView()
        }
    }
}

#Preview {
    TierComponent()
}
