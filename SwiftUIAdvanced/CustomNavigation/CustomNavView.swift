//
//  CustomNavView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView() {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
        
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}
