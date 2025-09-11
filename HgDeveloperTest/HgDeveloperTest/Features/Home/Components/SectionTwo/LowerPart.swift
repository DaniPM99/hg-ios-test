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
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1..<6) {index in
                    if (index <= insignias) {
                        challengeType.iconInsignia
                            .resizable()
                            .frame(width: 58, height: 58)
                            .rotationEffect(.degrees(Double(Int.random(in: (0..<361)))))
                    } else {
                        ZStack {
                            Image("missingStamp")
                            Text("\(index)")
                        }
                        .frame(width: 58, height: 58)
                    }
                }
            }
            HStack {
                ForEach(6..<11) {index in
                    if (index <= insignias) {
                        challengeType.iconInsignia
                            .resizable()
                            .frame(width: 58, height: 58)
                            .rotationEffect(.degrees(Double(Int.random(in: (0..<361)))))
                    } else {
                        ZStack {
                            Image("missingStamp")
                            if index < 10 {
                                Text("\(index)")
                            } else {
                                Image("gift")
                            }
                        }
                        .frame(width: 58, height: 58)
                    }
                }
            }
        }
        .frame(width: 339, height: 168)
        .background(.white)
    }
}

#Preview {
    LowerPart(insignias: 4, challengeType: .beans)
}
