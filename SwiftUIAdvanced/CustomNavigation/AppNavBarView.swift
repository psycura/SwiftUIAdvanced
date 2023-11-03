//
//  AppNavBarView.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink {
                    Text("Destination")
                        .customNavBarItems(title: "Destination Title")
                } label: {
                    Text("Navigate")
                }

            }
            .customNavigationTitle("Custom Title")
            .customNavigationSubtitle("My Subtitle")
            .customNavigationShowBackButton(false)
        }
    }
}

#Preview {
    AppNavBarView()
}

extension AppNavBarView {
    
    private var defaultView: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav Title here")
        }
    }
    
}
