//
//  TierComponent.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct TierComponent: View {
    let points: Float = 100
    var body: some View {
        VStack (spacing: 16) {
            VStack(alignment: .leading,spacing: 8) {
                HStack {
                    Text("YOU'RE A LEGEND.")
                        .font(.hgTitle)
                    Spacer()
                    HgButton(hgType: .knowMore)
                }
                HStack {
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
            .padding(.horizontal, 8)
            HgProgressView(points: 25)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    TierComponent()
}
