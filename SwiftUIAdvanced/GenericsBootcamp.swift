//
//  GenericsBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

final class GenericsBootcampVM: ObservableObject {
    
    @Published var stringModel = GenericModel(info: "hello, world")
    @Published var boolModel = GenericModel(info: false)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
    }
    
}

struct GenericView<T: View>: View {
    
    let title: String
    let content: T
    
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsBootcampVM()
    
    var body: some View {
        VStack {
            
            GenericView(title: "New View", content: Text("Content"))
            
            Text(vm.stringModel.info ?? "No data")
            Text(vm.boolModel.info?.description ?? "No data")

        }
    }
}

#Preview {
    GenericsBootcamp()
}
