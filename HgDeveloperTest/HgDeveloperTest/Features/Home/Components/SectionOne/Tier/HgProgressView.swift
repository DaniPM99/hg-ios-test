//
//  HgProgressView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct HgProgressView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    private let tiersLevels: [(title: String, startLevel: Float, lastLevel: Float)] = [
        ("Starter", 0, 20),
        ("Champ", 20, 50),
        ("Star", 50, 100),
        ("Legend", 100, 100)
    ]
    private let pointsFrontier: Float = 125
    private let progressViewDivision: Float = 3
    private let secondPhaseDownLimit: Int = 100
    private let secondPhaseUpLimit: Int = 200
    private let progressViewWidth: CGFloat = 316
    private let progressViewHeight: CGFloat = 58
    private let checkPointWidth: CGFloat = 80
    private let checkPointHeight: CGFloat = 30
    private let tierCircleSize: CGFloat = 19
    private let tierCircleBorder: CGFloat = 9
    private let checkPointYOffsize: CGFloat = -13
    private let checkPointTextsXOffsize: CGFloat = 25
    
    
    var body: some View {
        VStack (spacing: Spacing.md) {
            ProgressView(value: viewModel.points <= pointsFrontier ? viewModel.normalizedProgress() : viewModel.normalizedProgressSecondPhase(), total: viewModel.points <= pointsFrontier ? 3 : 1)
                .progressViewStyle(
                    LinearProgressViewStyle(tint:.honestVisibility)
                )
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
            HStack (spacing: Spacing.lg) {
                if viewModel.points <= pointsFrontier {
                    ForEach(tiersLevels, id: \.title) { tier in
                        tierCheckPoint(
                            tier.title,
                            Int(tier.startLevel),
                            Int(tier.lastLevel)
                        )
                    }
                } else {
                    tierCheckPointSecondPhase(secondPhaseDownLimit, secondPhaseUpLimit)
                }
            }
        }
        .frame(width: progressViewWidth, height: progressViewHeight)
    }
    
    func tierCheckPoint(_ title: String, _ startLevel: Int, _ lastLevel: Int) -> some View {
        VStack (spacing: Spacing.sm) {
            tierCircle(isActive: Int(viewModel.points) >= startLevel)
                .offset(y: checkPointYOffsize)
            Text(title)
                .font(.hgProgressView)
                .foregroundStyle(.baseGray)
            Text(startLevel != 100 ? "\(startLevel) - \(lastLevel)" : "100+")
                .font(.hgProgressView)
                .foregroundStyle(.disabled)
        }
        .frame(width: checkPointWidth, height: checkPointHeight)
    }
    
    func tierCheckPointSecondPhase(_ startLevel: Int, _ endLevel: Int) -> some View {
        HStack {
            VStack (spacing: Spacing.sm) {
                tierCircle(isActive: Int(viewModel.points) >= 100)
                    .offset(y: checkPointYOffsize)
                Text("Legend 2025")
                    .font(.hgProgressView)
                    .foregroundStyle(.black)
                    .offset(x: checkPointTextsXOffsize)
                Text("01/01/2025")
                    .font(.hgProgressView)
                    .foregroundStyle(.disabled)
                    .offset(x: checkPointTextsXOffsize)
            }
            .frame(width: checkPointWidth, height: checkPointHeight)
            .offset(x: -35)
            
            Spacer()
            
            VStack (spacing: Spacing.sm) {
                tierCircle(isActive: Int(viewModel.points) >= 200)
                    .offset(y: checkPointYOffsize)
                Text("Legend 2026")
                    .font(.hgProgressView)
                    .foregroundStyle(.baseGray)
                    .offset(x: checkPointTextsXOffsize * -1)
                Text("01/01/2026")
                    .font(.hgProgressView)
                    .foregroundStyle(.disabled)
                    .offset(x: checkPointTextsXOffsize * -1)
            }
            .frame(width: checkPointWidth, height: checkPointHeight)
            .offset(x: 35)
        }
        .frame(width: progressViewWidth)
    }
    
    func tierCircle(isActive: Bool) -> some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: tierCircleSize, height: tierCircleSize)
                .overlay(
                    Circle().stroke(
                        isActive ? .honestVisibility : .disabled,
                        lineWidth: tierCircleBorder
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
