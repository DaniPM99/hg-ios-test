//
//  Header.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct Header: View {
    let title: String
    let backButton: Bool
    let closeButton: Bool
    let dismiss: DismissAction
    
    var body: some View {
        HStack {
            if (backButton) {
                Image(.backButton)
            }
            Spacer()
            Text(title)
                .font(.hgRewardTitle)
                .foregroundStyle(.white)
            Spacer()
            if (closeButton) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundStyle(.terracota)
                    .frame(width: 26, height: 20)
                    .onTapGesture {dismiss()}
            }
        }
        .frame(height: 20)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @Environment(\.dismiss) var dismiss
    Header(
        title: "Honest People",
        backButton: true,
        closeButton: true,
        dismiss: dismiss
    )
        .padding(Spacing.sm)
        .background(.black)
}
