//
//  InsigniaRecount.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct InsigniaRecount: View {
    let insignias: Int
    private let InsigniaRecountWidth: CGFloat = 48
    private let InsigniaRecountHeight: CGFloat = 29
    var body: some View {
        HStack {
            Text("\(insignias) / 10")
                .font(.hgBody)
        }
        .frame(width: InsigniaRecountWidth, height: InsigniaRecountHeight)
        .padding([.vertical, .horizontal], Spacing.md)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 6)
                .cornerRadius(CornerRadius.xxs)
                .frame(width: InsigniaRecountWidth, height: InsigniaRecountHeight)
        )
        .opacity(0.2)
    }
}

#Preview {
    InsigniaRecount(insignias: 2)
}
