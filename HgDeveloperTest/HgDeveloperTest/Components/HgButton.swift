//
//  HgButton.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgButton: View {
    let hgType: HgButtonType
    var body: some View {
        HStack {
            if (hgType.icon != nil) {
                hgType.icon
            }
            Text(hgType.title)
                .font(.buttontitle)
                .foregroundColor(hgType.textColor)
        }
        .frame(width: hgType.width, height: hgType.height)
        .background(hgType.backgroundColor)
        .cornerRadius(hgType.cornerRadius)
    }
}

#Preview {
    HgButton(hgType: .knowMore)
}
