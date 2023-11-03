//
//  CustomNavBarView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let showBackButton: Bool
    let title: String
    let subTitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton.opacity(0)
            }
        }
        .padding()
        .tint(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))

        
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Some title", subTitle: nil)
        Spacer()
    }
}


extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subTitle {
                Text(subtitle)
            }
        }
    }
    
}
