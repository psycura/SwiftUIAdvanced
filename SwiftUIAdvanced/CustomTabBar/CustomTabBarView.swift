//
//  CustomTabBarView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]

    
    @Namespace private var namespace
    @Binding var selection: TabBarItem
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarV2
            .onChange(of: selection) { _, newValue in
                withAnimation (.easeInOut){
                    localSelection = newValue

                }
                
            }
    }
}

let mockTabs: [TabBarItem] = [
    .home,
    .favorites,
    .profile,
]

#Preview {
    
    VStack{
        Spacer()
        
        CustomTabBarView(tabs: mockTabs,
                         selection: .constant(mockTabs.first!),
                         localSelection: mockTabs.first!)
    }
}

extension CustomTabBarView {
    
    
    private func tabView(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var tabBarV1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab)
                    .onTapGesture {
                        swithcToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private var tabBarV2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab)
                    .onTapGesture {
                        swithcToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    private func swithcToTab(tab: TabBarItem) {
        selection = tab
        
    }
    
}


extension CustomTabBarView {
    
    private func tabView2(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "bg_rect", in: namespace)
                }
            }
        
        )
    }
}

