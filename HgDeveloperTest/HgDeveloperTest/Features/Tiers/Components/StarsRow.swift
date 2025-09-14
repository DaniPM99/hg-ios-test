//
//  StarsRow.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import SwiftUI

struct StarsRow: View {
    let numberOfStars: Int
    @State private var revealedStars = 0
    
    var body: some View {
        HStack {
            ForEach(1..<5) { index in
                Group {
                    if index <= revealedStars {
                        Image(systemName: "sparkle")
                            .foregroundStyle(.white)
                            .transition(.scale.combined(with: .opacity))
                    } else {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.terracota)
                    }
                }
            }
        }
        .onAppear {
            animateStars()
        }
    }
    
    private func animateStars() {
        revealedStars = 0
        for i in 1...numberOfStars {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.3) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    revealedStars = i
                }
            }
        }
    }
}

#Preview {
    StarsRow(numberOfStars: 2)
}
