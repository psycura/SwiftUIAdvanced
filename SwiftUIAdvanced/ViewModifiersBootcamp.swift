//
//  ViewModifiersBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    var bgColor: Color?
        
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .background(Color.blue)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(bgColor ?? .red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(bgColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor))
    }
    
}

struct ViewModifiersBootcamp: View {
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello Modifier")
                .font(.headline)
                .modifier(DefaultButtonViewModifier(bgColor: .yellow))
            
            Text("Hello Extension")
                .font(.subheadline)
                .withDefaultButtonFormatting(bgColor: .green)
                .padding()

            
            Text("Hello Everyone")
                .font(.title)
                .withDefaultButtonFormatting()
                .padding()
        }
    }
}

#Preview {
    ViewModifiersBootcamp()
}
