//
//  CustomNavBarContainerView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private  var showBackButton: Bool = true
    @State private  var title: String = ""
    @State private  var subTitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onPreferenceChange(CustomNavBarShowBackButtonPreferencekey.self, perform: { value in
                    showBackButton = value
                })
                .onPreferenceChange(CustomNavBarSubtitlePreferencekey.self, perform: { value in
                    subTitle = value
                })
                .onPreferenceChange(CustomNavBarTitlePreferencekey.self, perform: { value in
                    title = value
                })
        }
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text("Hello World")
                .foregroundStyle(.white)
        }
    }
}
