//
//  CustomTabBarContainerView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View> : View {
    
    @Binding var selection: TabBarItem
    
    let content: Content
    
    @State private var tabs: [TabBarItem] = []
    
    init(
        selection: Binding<TabBarItem>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content ()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}


struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let mockTabs: [TabBarItem] = [
        .home,
        .favorites,
        .profile,
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(mockTabs.first!)) {
            Color.red
        }
    }
}
