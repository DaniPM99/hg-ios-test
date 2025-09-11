//
//  InsigniaRecount.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct InsigniaRecount: View {
    let insignias: Int
    var body: some View {
        HStack {
            Text("\(insignias) / 10")
                .font(.hgBody)
        }
        .frame(width: 48, height: 29)
        .padding([.vertical, .horizontal], 16)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 6)
                .cornerRadius(6)
                .frame(width: 48, height: 29)
        )
        .opacity(0.2)
    }
}

#Preview {
    InsigniaRecount(insignias: 2)
}
