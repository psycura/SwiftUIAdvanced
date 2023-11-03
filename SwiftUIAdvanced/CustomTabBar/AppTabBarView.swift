//
//  AppTabBarView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem (.home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(.favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(.profile, selection: $tabSelection)
        }
    }
}

#Preview {
    
    AppTabBarView()
}

extension AppTabBarView {
    
    private var defaultView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("profile")
                }
        }
    }
    
}
