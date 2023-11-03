//
//  UIViewRepresentableBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    
    @State private var text: String = ""
    
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI: ")
                TextField("Type Here", text: $text)
                    .frame(height: 55)
                .background(Color.gray)
            }
            
            HStack {
                Text("UIKit: ")

                UITextFieldViewRepresentable(
                    text: $text
                )
                .updatePlaceholder("New Placeholder")
                .frame(height: 55)
                .background(Color.gray)
            }
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}


struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>,
         placeholder: String = "Default placeholder",
         placeholderColor: UIColor = .red) {
        
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        
        textField.delegate = context.coordinator
        
        return textField
    }
    
    // from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        
        let placeholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: placeholderColor
            
            ]
        )
        
        textField.attributedPlaceholder = placeholder
      
        
        return textField
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        
        viewRepresentable.placeholder = text
        
        
        return viewRepresentable
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
         return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
    }
    
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        
        view.backgroundColor = .red
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
