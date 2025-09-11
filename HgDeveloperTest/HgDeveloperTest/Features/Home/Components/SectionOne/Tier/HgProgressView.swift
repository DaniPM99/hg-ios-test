//
//  HgProgressView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgProgressView: View {
    let points: Float
    let tiersLevels: [(title: String, startLevel: Float, lastLevel: Float)] = [
        ("Starter", 0, 20),
        ("Champ", 20, 50),
        ("Star", 50, 100),
        ("Legend", 100, 100)
    ]
    var body: some View {
        VStack (spacing: 12) {
            ProgressView(value: points, total: 80)
                .progressViewStyle(
                    LinearProgressViewStyle(tint:.honestVisibility)
                )
                .scaleEffect(x: 1, y: 2, anchor: .center)
                
            HStack (spacing: 40) {
                ForEach(tiersLevels, id: \.title) { tier in
                    tierCheckPoint(
                        tier.title,
                        Int(tier.startLevel),
                        Int(tier.lastLevel)
                    )
                }
            }
        }
        .frame(width: 316, height: 58)
    }
    
    func tierCheckPoint(_ title: String, _ startLevel: Int, _ lastLevel: Int) -> some View {
        VStack (spacing: 8) {
            tierCircle(isActive: Int(points) > startLevel)
                .offset(y: -10)
            Text(title)
                .font(.hgProgressView)
                .foregroundStyle(.baseGray)
            Text(startLevel != 100 ? "\(startLevel) - \(lastLevel)" : "100+")
                .font(.hgProgressView)
                .foregroundStyle(.disabled)
        }
        .frame(width: 60, height: 30)
    }
    
    func tierCircle(isActive: Bool) -> some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 19, height: 19)
                .overlay(
                    Circle().stroke(
                        isActive ? .honestVisibility : .disabled,
                        lineWidth: 9
                    )
                )
        }
    }
}

#Preview {
    HgProgressView(points: 25)
}
