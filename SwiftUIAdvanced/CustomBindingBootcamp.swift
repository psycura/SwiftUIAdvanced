//
//  CustomBindingBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 18/10/2023.
//

import SwiftUI


extension Binding where Value == Bool {
    
    init<T>(value: Binding<T?>) {
        
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }

    }
    
}

struct CustomBindingBootcamp: View {
    
    @State var title: String = "Start"
    
    @State private var errorTitle: String? = nil

    var body: some View {
        VStack {
            Text(title)
            
            ChildView(title: $title)
            
            ChildView2(title: title) { newTitle in
                title = newTitle
            }
            
            ChildView3(title: $title)
            
            ChildView3(
                title: Binding(
                    get: { title },
                    set: { newValue in
                        title = newValue
                    }
                )
            )
            
            Button("Click Me") {
                errorTitle = "New Error"
            }
        }
        .alert(
            errorTitle ?? "Error",
            isPresented: Binding(value: $errorTitle)
        ) {
            Button("Ok") {}
        }
    }
}

struct ChildView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
    }
}

struct ChildView2: View {
    
    let title: String
    let setTitle: (String) -> ()
    
    var body: some View {
        Text(title)
    }
}


struct ChildView3: View {
    
    var title: Binding<String>
    
    var body: some View {
        Text(title.wrappedValue)
            .onAppear {
                title.wrappedValue = "New Title 3"
            }
    }
}

#Preview {
    CustomBindingBootcamp()
}
