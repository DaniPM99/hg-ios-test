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
    let headerHeight: CGFloat = 20
    let imageHeight: CGFloat = 20
    let imageWidth: CGFloat = 26
    
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
                    .frame(width: imageWidth, height: imageHeight)
                    .onTapGesture {dismiss()}
            }
        }
        .frame(height: headerHeight)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .padding(.horizontal, Spacing.md)
        .padding(.vertical, Spacing.md)
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
