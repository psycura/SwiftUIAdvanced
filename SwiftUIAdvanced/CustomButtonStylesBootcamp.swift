//
//  CustomButtonStylesBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    
}

struct CustomButtonStylesBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting()
        }
        .buttonStyle(PressableButtonStyle(scaledAmount: 0.95))
        .padding(40)
        
        Button {
            
        } label: {
            Text("With Button Style")
                .font(.headline)
                .withDefaultButtonFormatting(bgColor: .green)

        }
        .withPressableStyle()
        .padding(40)

    }
}

#Preview {
    CustomButtonStylesBootcamp()
}
