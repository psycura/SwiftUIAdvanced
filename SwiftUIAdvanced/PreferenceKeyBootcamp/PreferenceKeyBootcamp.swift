//
//  PreferenceKeyBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello, World!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    
            }
            .navigationTitle("Navigation Title")
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromDB)
            .customTitle(newValue)
            
    }
    
    func getDataFromDB() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            newValue = "New Value from DB"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}
