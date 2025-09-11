//
//  TierLegend.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct TierTag: View {
    let tagStyle: TagType
    let tierActive: Bool
    var body: some View {
        HStack {
            tagStyle.icon(tierActive: tierActive)
            Text(tagStyle.title(tierActive: tierActive))
                .bold()
        }
        .frame(width: 116, height: 34)
        .background(tagStyle.color)
        .cornerRadius(6)
    }
}

#Preview {
    TierTag(tagStyle: .bronze, tierActive: false)
}
