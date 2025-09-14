//
//  HgProgressView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgProgressView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let tiersLevels: [(title: String, startLevel: Float, lastLevel: Float)] = [
        ("Starter", 0, 20),
        ("Champ", 20, 50),
        ("Star", 50, 100),
        ("Legend", 100, 100)
    ]
    var body: some View {
        VStack (spacing: 12) {
            if viewModel.points <= 125 {
                ProgressView(value: viewModel.normalizedProgress(), total: 3)
                    .progressViewStyle(
                        LinearProgressViewStyle(tint:.honestVisibility)
                    )
                    .scaleEffect(x: 1, y: 2, anchor: .center)
            } else {
                ProgressView(value: viewModel.normalizedProgressSecondPhase(), total: 1)
                    .progressViewStyle(LinearProgressViewStyle(tint:.honestVisibility))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
            }
                
            HStack (spacing: 20) {
                if viewModel.points <= 125 {
                    ForEach(tiersLevels, id: \.title) { tier in
                            tierCheckPoint(
                                tier.title,
                                Int(tier.startLevel),
                                Int(tier.lastLevel)
                            )
                    }
                } else {
                    tierCheckPointSecondPhase(100, 200)
                }
            }
        }
        .frame(width: 316, height: 58)
    }
    
    func tierCheckPoint(_ title: String, _ startLevel: Int, _ lastLevel: Int) -> some View {
        VStack (spacing: 8) {
            tierCircle(isActive: Int(viewModel.points) >= startLevel)
                .offset(y: -10)
            Text(title)
                .font(.hgProgressView)
                .foregroundStyle(.baseGray)
            Text(startLevel != 100 ? "\(startLevel) - \(lastLevel)" : "100+")
                .font(.hgProgressView)
                .foregroundStyle(.disabled)
        }
        .frame(width: 80, height: 30)
    }
    
    func tierCheckPointSecondPhase(_ startLevel: Int, _ endLevel: Int) -> some View {
        HStack {
            VStack (spacing: 8) {
                tierCircle(isActive: Int(viewModel.points) >= 100)
                    .offset(y: -10)
                Text("Legend 2025")
                    .font(.hgProgressView)
                    .foregroundStyle(.black)
                    .offset(x: 25)
                Text("01/01/2025")
                    .font(.hgProgressView)
                    .foregroundStyle(.disabled)
                    .offset(x: 25)
            }
            .frame(width: 80, height: 30)
            .offset(x: -35)

            Spacer()

            VStack (spacing: 8) {
                tierCircle(isActive: Int(viewModel.points) >= 200)
                    .offset(y: -10)
                Text("Legend 2026")
                    .font(.hgProgressView)
                    .foregroundStyle(.baseGray)
                    .offset(x: -25)
                Text("01/01/2026")
                    .font(.hgProgressView)
                    .foregroundStyle(.disabled)
                    .offset(x: -25)
            }
            .frame(width: 80, height: 30)
            .offset(x: 35)
        }
        .frame(width: 316) // mismo ancho que tu progressView
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
    var viewModel = HomeViewModel()
    HgProgressView()
        .environmentObject(viewModel)
}
