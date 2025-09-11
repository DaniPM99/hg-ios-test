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
    
    var body: some View {
        HStack {
            if (backButton) {
                Image(.backButton)
            }
            Spacer()
            Text(title)
                .foregroundStyle(.white)
            Spacer()
            if (closeButton) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 26, height: 20)
            }
        }
        .frame(width: .infinity, height: 20)
    }
}

#Preview {
    Header(
        title: "Honest People",
        backButton: true,
        closeButton: true
    )
        .padding(8)
        .background(.black)
}
