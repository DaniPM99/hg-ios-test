//
//  HomeViewModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var userName: String = "Dani"
    @Published var points: Float = Float.random(in: 0...100)
    @Published var greenInsignias: Float = Float.random(in: 0...10)
    @Published var beansInsignias: Float = Float.random(in: 0...10)
    @Published var expireDate: String = Date().description

    var tier: TagType {
        if points >= 0 && points < 20 {
            return .bronze
        } else if points >= 20 && points < 50 {
            return .silver
        } else if points >= 50 && points < 100 {
            return .gold
        } else {
            return .emerald
        }
    }
}
