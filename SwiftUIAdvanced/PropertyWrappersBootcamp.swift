//
//  PropertyWrappersBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 29/10/2023.
//

import SwiftUI

extension FileManager {
    static func documentsPath(_ key: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "\(key).txt")
    }
}

@propertyWrapper
struct FileManagerProperty: DynamicProperty {
      
    @State private var title: String
    let key: String
    
    var wrappedValue: String {
        get { title }
        nonmutating set { save(newValue) }
    }
    
    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }

    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        do {
            title = try String(contentsOf: FileManager.documentsPath(key), encoding: .utf8)
            print("SUCCESS READ")

        } catch {
            print("ERROR READ: \(error)")
            
            title = wrappedValue

        }
    }
    

    
    func save(_ value: String) {
        do {
            try value.write(
                to: FileManager.documentsPath(key),
                atomically: false,
                encoding: .utf8
            )
            
            title = value
            print("SUCCESS SAVED")
            
        } catch {
            print("ERROR SAVING: \(error)")
        }
    }
}

struct PropertyWrappersBootcamp: View {
    
    @FileManagerProperty("custom_title") var title: String = "Starting Text"
    @FileManagerProperty("custom_title2") var title2: String = "Starting Text2"
    
    @State var subtitle: String = "Subtitle"
       
    var body: some View {
        VStack(spacing: 40) {
            Text(title)
                .font(.largeTitle)
            Text(title2)
                .font(.largeTitle)
            
            PropertyWrappersChildView(subtitle: $title)
            
            Button("Click Me 1") {
                title = "title 1"
            }
            
            Button("Click Me 2") {
                title = "title 2"

            }
        }
    }
}

struct PropertyWrappersChildView: View {
    
    @Binding var subtitle: String
    
    var body: some View {
        Button {
            subtitle = "Another title"
        } label: {
            Text(subtitle)
                .font(.subheadline)
        }

    }
}

#Preview {
    PropertyWrappersBootcamp()
}
