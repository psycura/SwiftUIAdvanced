//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 16/10/2023.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    
    func onScrollViewOffsetChange(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
        background(
            GeometryReader { geo in
                Text("")
                    .preference(key: ScrollViewOffsetPreferenceKey.self,
                                value: geo.frame(in: .global).minY)
            }
        )
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: action )
    }
    
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    let title: String = "New title here!!!"
    
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollOffset / 75.0))
                    .onScrollViewOffsetChange { offset in
                        self.scrollOffset = offset
                    }

                contentLayer
            }
            .padding()
        }
        .overlay(content: {
            Text("\(scrollOffset)")
        })
        .overlay(alignment: .top) { 
            navBar
                .opacity(scrollOffset < 40 ? 1.0 : 0.0)

        }
    }
}



#Preview {
    ScrollViewOffsetPreferenceKeyBootcamp()
}


extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text (title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30, id: \.self) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBar: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
