//
//  LowerPart.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct LowerPart: View {
    let insignias: Int
    let challengeType: ChallengeType
    private let lowerPartSize: CGFloat = 58
    private let lowerPartHeight: CGFloat = 168
    private let insigniasIconLimit: Int = 10
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1..<6) {index in
                    if (index <= insignias) {
                        challengeType.iconInsignia
                            .resizable()
                            .frame(width: lowerPartSize, height: lowerPartSize)
                            .rotationEffect(.degrees(Double(Int.random(in: (0..<361)))))
                    } else {
                        ZStack {
                            Image("missingStamp")
                            Text("\(index)")
                        }
                        .frame(width: lowerPartSize, height: lowerPartSize)
                    }
                }
            }
            HStack {
                ForEach(6..<11) {index in
                    if (index <= insignias) {
                        challengeType.iconInsignia
                            .resizable()
                            .frame(width: lowerPartSize, height: lowerPartSize)
                            .rotationEffect(.degrees(Double(Int.random(in: (0..<361)))))
                    } else {
                        ZStack {
                            Image("missingStamp")
                            if index < insigniasIconLimit {
                                Text("\(index)")
                            } else {
                                Image("gift")
                            }
                        }
                        .frame(width: lowerPartSize, height: lowerPartSize)
                    }
                }
            }
        }
        .frame(height: lowerPartHeight)
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

#Preview {
    LowerPart(insignias: 4, challengeType: .beans)
}
