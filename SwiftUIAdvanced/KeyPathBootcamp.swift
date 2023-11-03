//
//  KeyPathBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 22/10/2023.
//

import SwiftUI

struct MyDataModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let count: Int
    let data: Date
    
}

extension Array {
    func sortedByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self.sorted { item1, item2 in
            ascending ?
            item1[keyPath: keyPath] < item2[keyPath: keyPath]
            : item1[keyPath: keyPath] > item2[keyPath: keyPath]
        }
        
    }
}


struct KeyPathBootcamp: View {
    

    @AppStorage("user_count") var userCount: Int = 0
    @State private var dataArray: [MyDataModel] = []
    
    
    var body: some View {
        List {
            ForEach(dataArray) { item in
                VStack(alignment: .leading){
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.data.description)
                }
                .font(.headline)
            }
        }
        .onAppear {
            let array = [
                MyDataModel(title: "Three", count: 3, data: .distantFuture),
                MyDataModel(title: "One", count: 1, data: .now),
                MyDataModel(title: "Two", count: 2, data: .distantPast),
            ]
            
//            let newArray = array.sorted { item1, item2 in
//                item1.count < item2.count
//            }
            
//            let newArray = array.sorted { item1, item2 in
//                item1[keyPath: \.count] < item2[keyPath: \.count]
//            }
            
            let newArray = array.sortedByKeyPath(\.count, ascending: false)
            
            dataArray = newArray
        }
    }
}

#Preview {
    KeyPathBootcamp()
}
