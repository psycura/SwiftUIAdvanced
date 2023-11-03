//
//  ViewBuilderBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct HeadrViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
            .fontWeight(.semibold)
            
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<T: View>: View {
    let title: String
    let content: T
    
    init(title: String, @ViewBuilder content:() -> T) {
        self.title = title
        self.content = content()
    }

    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
            .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct CustomHStack<T: View>:View {
    
    let content: T
    
    init(@ViewBuilder content:() -> T) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}



struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeadrViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            
            HeadrViewRegular(title: "Second Title", description: nil, iconName: nil)
            
            HeaderViewGeneric(title: "Generic Title") {
                VStack(alignment: .leading) {
                    Text("Content")
                    Image(systemName: "heart")
                }
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hi")
            }
            
            Spacer()
        }
    }
}

#Preview {
//    ViewBuilderBootcamp()
    LocalViewBuilder(type: .two)
}


struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
  @ViewBuilder private var headerSection: some View {
      switch type {
      case .one:
          viewOne
      case .two:
          viewTwo
      case .three:
          viewThree
      }
    }
    
    
    
    private var viewOne: some View {
        Text("One")

    }
    
    private var viewTwo: some View {
        VStack {
            Text("Two")
            Image(systemName: "heart")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart")

    }
    
}
