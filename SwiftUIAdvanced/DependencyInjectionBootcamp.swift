//
//  DependencyInjectionBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 17/10/2023.
//

import SwiftUI
import Combine


struct PostsModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
    var url: URL {get}
    func getData() -> AnyPublisher<[PostsModel], Error>
}
//
//class ProductionDataService: DataServiceProtocol {
//    
//    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//    
//    func getData() -> AnyPublisher<[PostsModel], Error> {
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map({ $0.data })
//            .decode(type: [PostsModel].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//    
//}
//
//class DependencyInjectionVM: ObservableObject {
//    
//    private let dataService: DataServiceProtocol
//    
//    @Published var dataArray: [PostsModel] = []
//    
//    var cancellables = Set<AnyCancellable>()
//    
//    init(dataService: DataServiceProtocol) {
//        self.dataService = dataService
//        loadPosts()
//    }
//    
//    private func loadPosts() {
//        dataService.getData()
//            .sink { _ in
//                
//            } receiveValue: { [weak self] posts in
//                self?.dataArray = posts
//            }
//            .store(in: &cancellables)
//
//    }
//    
//}
//
//struct DependencyInjectionBootcamp: View {
//    
//    @StateObject private var vm: DependencyInjectionVM
//    
//    init(dataService: DataServiceProtocol) {
//        _vm = StateObject(wrappedValue: DependencyInjectionVM(dataService: dataService))
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text("Posts")
//                    .font(.largeTitle)
//                ForEach(vm.dataArray) { post in
//                    Text(post.title)
//                }
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    DependencyInjectionBootcamp(dataService: ProductionDataService())
//}
