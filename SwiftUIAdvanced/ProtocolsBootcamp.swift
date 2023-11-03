//
//  ProtocolsBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

class DefaultDataSource {
    var buttonText: String = "Protocols are awesome!"
}

struct ProtocolsBootcamp: View {
    
    let colorTheme: ColorThemeProtocol
    let dataSource: DefaultDataSource
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProtocolsBootcamp(
        colorTheme: DefaultColorTheme(),
        dataSource: DefaultDataSource()
    )
}
