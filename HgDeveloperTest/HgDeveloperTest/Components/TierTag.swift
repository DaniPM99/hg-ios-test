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
    let isAnimated: Bool
    @State private var animate = false
    @State private var offsetX: CGFloat = -70 // empieza un poco a la izquierda
    
    var body: some View {
        HStack {
            tagStyle.icon(tierActive: tierActive)
                .scaleEffect(animate ? 1.0 : 1.4) // de peque a normal
                .onAppear {
                    withAnimation(.easeOut(duration: 0.8)) {
                        animate = true
                    }
                }
            Text(tagStyle.title(tierActive: tierActive))
                .bold()
        }
        .frame(width: 116, height: 34)
        .background(tagStyle.color)
        .cornerRadius(6)
        .offset(x: isAnimated ? offsetX : 0)
        .onAppear {
            if isAnimated {
                withAnimation(.easeOut(duration: 1)) {
                    offsetX = 0
                }
            }
        }
    }
}

#Preview {
    TierTag(
        tagStyle: .bronze,
        tierActive: false,
        isAnimated: false)
}
