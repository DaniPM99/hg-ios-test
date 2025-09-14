//
//  SheetOrFullScreenViewModifier.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import SwiftUI

import SwiftUI

struct SheetOrFullScreen<SheetView: View>: ViewModifier {
    @Binding var isPresented: Bool
    let builder: () -> SheetView

    func body(content: Content) -> some View {
        let isPad = UIDevice.current.userInterfaceIdiom == .pad

        // Bindings “filtrados”: solo se activan en el dispositivo correcto
        let phoneBinding = Binding<Bool>(
            get: { !isPad && isPresented },
            set: { newValue in if !isPad { isPresented = newValue } }
        )

        let padBinding = Binding<Bool>(
            get: { isPad && isPresented },
            set: { newValue in if isPad { isPresented = newValue } }
        )

        return content
            .sheet(isPresented: phoneBinding) {
                builder()
            }
            .fullScreenCover(isPresented: padBinding) {
                builder()
            }
    }
}

extension View {
    func sheetOrFullScreen<SheetView: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetView
    ) -> some View {
        modifier(SheetOrFullScreen(isPresented: isPresented, builder: content))
    }
}

