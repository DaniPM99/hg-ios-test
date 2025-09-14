//
//  HgTierButton.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgTierButton: View {
    let action: () -> Void
    var body: some View {
        HStack {
            Text("Ver beneficios")
                .font(.hgRewardTitle)
                .foregroundColor(.terracota)
        }
        .frame(width: 156, height: 49)
        .background(.white)
        .cornerRadius(25)
        .onTapGesture {action()}
    }
}

#Preview {
    HgTierButton(action: {})
}
