//
//  TabBarItem.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    
    case home, favorites, profile
    
    
    var iconName: String {
        switch self {
            
        case .home:
            "house"
        case .favorites:
            "heart"
        case .profile:
            "person"
        }
    }
    
    var title: String {
        switch self {
            
        case .home:
            "Home"
        case .favorites:
            "Favorites"
        case .profile:
            "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
                .red
        case .favorites:
                .blue
        case .profile:
                .green
        }
    }
    
}
