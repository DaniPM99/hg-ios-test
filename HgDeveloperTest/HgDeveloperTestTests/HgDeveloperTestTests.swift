//
//  HgDeveloperTestTests.swift
//  HgDeveloperTestTests
//
//  Created by Daniel Parra Martin on 9/9/25.
//

import Testing
@testable import HgDeveloperTest

struct HgDeveloperTestTests {
    struct HHomeViewModelTests {
        @Test func addPoints() {
            let viewModel = HomeViewModel()
            let points = viewModel.points
            viewModel.operatePoints(operation: "+")
            if (points <= 200) {
                #expect(viewModel.points == points + 10)
            } else {
                #expect(viewModel.points == points)
            }
        }
        
        @Test func subtractPoints() {
            let viewModel = HomeViewModel()
            let points = viewModel.points
            viewModel.operatePoints(operation: "-")
            if (points >= 10) {
                #expect(viewModel.points == points - 10)
            } else {
                #expect(viewModel.points == points)
            }
        }
    }
}
