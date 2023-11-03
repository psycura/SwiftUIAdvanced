//
//  FutureWrappersBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 18/10/2023.
//

import SwiftUI
import Combine

class FuturesBootcampVM: ObservableObject {
    
    @Published var title: String = "Starting Title"
    let url = URL(string: "https://www.google.com")!
    var cancelables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    
    func download() {
        
//        getCombinePublisher()
        getFuturePublisher()
            .sink { _ in
            } receiveValue: { [weak self] value in
                self?.title = value
            }
            .store(in: &cancelables)
//
//        getEscapingClosure { [weak self] value, error in
//            self?.title = value
//        }
        
        
        
    }
    
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New Value"
            })
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completion: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            completion("New Value 2", nil)
        }
        .resume()
    }
    
    func getFuturePublisher() -> Future<String, Error> {
        return Future {[weak self] promise in
            self?.getEscapingClosure { value, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(value))
                }
            }
        }
    }
    
}


struct FuturesBootcamp: View {
    
    @StateObject private var vm = FuturesBootcampVM()
    
    var body: some View {
        Text(vm.title)
    }
}

#Preview {
    FuturesBootcamp()
}
