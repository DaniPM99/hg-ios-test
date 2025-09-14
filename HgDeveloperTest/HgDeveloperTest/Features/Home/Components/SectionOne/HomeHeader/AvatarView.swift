//
//  AvatarView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct AvatarView: View {
    private let avatarSize: CGFloat = 84
    private let avatarBorder: CGFloat = 4
    var body: some View {
        Image("profileImage")
            .resizable()
            .scaledToFill()
            .frame(width: avatarSize, height: avatarSize)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: avatarBorder)
            )
    }
}

#Preview {
    AvatarView()
}
