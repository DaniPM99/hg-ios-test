//
//  HomeSectionThree.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

struct HomeSectionThree: View {
    var expireDate: String
    var body: some View {
        Divider()
            .tint(.black)
        HStack {
            Image("calendar")
                .tint(.disabled)
            Text("Tus sellos caducan el \(expireDate).\nTu tier se resetea el \(expireDate).")
                .foregroundStyle(.disabled)
        }
    }
}

#Preview {
    HomeSectionThree(expireDate: "01/01/2026")
}
