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
    @State private var offsetX: CGFloat = -70
    private let tierTagStandardPosition: CGFloat = 0
    private let tierTagWidth: CGFloat = 116
    private let tierTagHeight: CGFloat = 34
    private let tierTagAnimationDuration: CGFloat = 1
    private let iconCurrentSize: CGFloat = 1.0
    private let iconBiggerSize: CGFloat = 1.4
    private let iconAnimationDuration: CGFloat = 0.8
    
    
    var body: some View {
        HStack {
            tagStyle.icon(tierActive: tierActive)
                .scaleEffect(animate ? iconCurrentSize : iconBiggerSize)
                .onAppear {
                    withAnimation(.easeOut(duration: iconAnimationDuration)) {
                        animate = true
                    }
                }
            Text(tagStyle.title(tierActive: tierActive))
                .bold()
        }
        .frame(width: tierTagWidth, height: tierTagHeight)
        .background(tagStyle.color)
        .cornerRadius(CornerRadius.xxs)
        .offset(x: isAnimated ? offsetX : tierTagStandardPosition)
        .onAppear {
            if isAnimated {
                withAnimation(.easeOut(duration: tierTagAnimationDuration)) {
                    offsetX = tierTagStandardPosition
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
