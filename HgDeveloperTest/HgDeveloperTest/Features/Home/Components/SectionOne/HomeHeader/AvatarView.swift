//
//  AvatarView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        Image("profileImage")
            .resizable()
            .scaledToFill()
            .frame(width: 84, height: 84)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
    }
}

#Preview {
    AvatarView()
}
