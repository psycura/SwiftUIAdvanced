//
//  AdvancedCombineBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 18/10/2023.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
    @Published var basicPublisher: String = "Zero"
    let currentValuePublisher = CurrentValueSubject<String, Error>("first")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
//        let items =  ["one", "two", "three"]
        let items: [Int] = Array(0..<11)
        for x in items {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
//                self.basicPublisher = items[x]
//                self.currentValuePublisher.send(items[x])
                self.passThroughPublisher.send(x)
            }
        }

    }
}

class AdvancedCombineBootcampVM: ObservableObject {
    
    private let dataService: AdvancedCombineDataService = AdvancedCombineDataService()
    
    @Published var data: [String] = []
    
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
//        dataService.$basicPublisher
//        dataService.currentValuePublisher
        dataService.passThroughPublisher
            
        // Sequence operations
        
            
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
                
            } receiveValue: {[weak self] receivedData in
                self?.data.append(receivedData)
            }
            .store(in: &cancelables)

    }
    
    
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm: AdvancedCombineBootcampVM = AdvancedCombineBootcampVM()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text("Published \($0)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
