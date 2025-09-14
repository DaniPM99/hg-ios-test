//
//  HgTierButton.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgTierButton: View {
    private let hgTierButtonWidth: CGFloat = 156
    private let hgTierButtonHeight: CGFloat = 49
    
    let action: () -> Void
    var body: some View {
        HStack {
            Text("Ver beneficios")
                .font(.hgRewardTitle)
                .foregroundColor(.terracota)
        }
        .frame(width: hgTierButtonWidth, height: hgTierButtonHeight)
        .background(.white)
        .cornerRadius(CornerRadius.xl)
        .onTapGesture {action()}
    }
}

#Preview {
    HgTierButton(action: {})
}
