//
//  ErrorAlertBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 18/10/2023.
//

import SwiftUI

protocol AppAlert {
    var title: String {get}
    var subtitle: String? {get}
    var buttons: AnyView {get}
}

enum MyCustomAlert: Error, LocalizedError, AppAlert {
    case noInternetConnection
    case dataNotFound
    case urlError(_ error: Error)
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "Please check your internet connection"
        case .dataNotFound:
            return "There was error in loading data"
        case .urlError(let error):
            return "Error \(error.localizedDescription)"
        }
    }
    
    var title: String {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .dataNotFound:
            return "Data not found"
        case .urlError(_):
            return "Error"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .noInternetConnection:
            return "Please check your internet connection"
        case .dataNotFound:
            return nil
        case .urlError(let error):
            return "Error \(error.localizedDescription)"
        }
    }
    
    var buttons: AnyView {
        AnyView(getAlertButtons())
    }
    
    @ViewBuilder
    func getAlertButtons() -> some View {
        switch self {
        case .noInternetConnection:
            Button("OK"){}
        case .dataNotFound:
            Button("DELETE", role: .destructive){}
        default:
            Button("RETRY"){}

        }
    }
}

extension View {
    
    func showCustomAlert<T: AppAlert>(alert: Binding<T?>) -> some View {
        self
            .alert(alert.wrappedValue?.title ?? "Error", isPresented: Binding(value: alert)) {
                alert.wrappedValue?.buttons
            } message: {
                if let subtitle = alert.wrappedValue?.subtitle {
                    Text(subtitle)
                }
            }
    }
    
}

struct ErrorAlertBootcamp: View {
    
    @State private var alert: MyCustomAlert? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .showCustomAlert(alert: $alert)

    }
    

    
    
    enum MyCustomError: Error, LocalizedError {
        case noInternetConnection
        case dataNotFound
        case urlError(_ error: Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection"
            case .dataNotFound:
                return "There was error in loading data"
            case .urlError(let error):
                return "Error \(error.localizedDescription)"
            }
        }
    }
    
    
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            
//            let myError: Error = MyCustomError.noInternetConnection
            let myError: MyCustomAlert = MyCustomAlert.urlError(URLError(.badURL))
            
            alert = myError
        }
        

    }
}

#Preview {
    ErrorAlertBootcamp()
}
