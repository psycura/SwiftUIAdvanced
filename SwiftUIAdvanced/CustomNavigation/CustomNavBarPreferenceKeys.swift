//
//  CustomNavBarPreferenceKeys.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import Foundation
import SwiftUI


struct CustomNavBarTitlePreferencekey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarSubtitlePreferencekey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
    
}

struct CustomNavBarShowBackButtonPreferencekey: PreferenceKey {
    
    static var defaultValue: Bool = true
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}


extension View {
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferencekey.self, value: title)
    }
    
    func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferencekey.self, value: subtitle)
    }
    
    func customNavigationShowBackButton(_ showButton: Bool) -> some View {
        preference(key: CustomNavBarShowBackButtonPreferencekey.self, value: showButton)
    }
    
    func customNavBarItems(title: String = "", 
                           subtitle: String? = nil,
                           showBackButton: Bool = true) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationShowBackButton(showBackButton)
    }
    
}

