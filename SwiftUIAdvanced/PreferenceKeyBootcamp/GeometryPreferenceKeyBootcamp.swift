//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack() {
            Text("Hello World")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)

            Spacer()
            HStack {
                Rectangle()
                GeometryReader { geometry in
                    Rectangle()
                        .updateRectengleGeoSize(size: geometry.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometryPreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

#Preview {
    GeometryPreferenceKeyBootcamp()
}

extension View {
    
    func updateRectengleGeoSize(size: CGSize) -> some View {
        preference(key: RectangleGeometryPreferenceKey.self, value: size)
    }
    
}

struct RectangleGeometryPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
    
}
