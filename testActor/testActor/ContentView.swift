//
//  ContentView.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/08.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var model = ViewModel()
//    var body: some View {
//        VStack {
//            Text(model.message ?? "")
//                .padding()
//            Button("push me") {
//                didTapButton()
//            }
//        }
//    }
//    func didTapButton() {
//        Task {
//            let result = await model.fetchMessage(url: "push")
//            print("result \(result ?? "")")
//
//            let result2 = await model.fetchMessage(url: "push")
//            print("result2 \(result2 ?? "")")
//
//            let result3 = await model.fetchMessage(url: "push")
//            print("result3 \(result3 ?? "")")
//        }
//    }
    
    @ObservedObject var viewModel: ViewModel2 = .init()
    var body: some View {
        VStack {
         
            TextField.init("search respository", text: $viewModel.query)
                .padding(4)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            
            Group {
                
                if !viewModel.hasError {
                    VStack {
                        if viewModel.loading {
                            ProgressView()
                                .progressViewStyle(.automatic)
                                .frame(width: 50, height: 50)
                                .scaleEffect(2.0)
                            
                        }
                        List {
                            ForEach.init(viewModel.item) { item in
                                RepositoryRow(item: item)
                            }
                        }.frame(maxHeight: .infinity)
                    }
                } else {
                    VStack {
                        Image(systemName: "xmark.octagon.fill")
                            .font(.system(size: 80))
                        Text("Error").font(.title)
                        Text(self.viewModel.errorMessage).font(.body)
                    }
                    .padding()
                    .foregroundColor(.gray)
                }
            }.frame(maxHeight: .infinity)
        }
    }
}
extension SearchRepositoryItem: Identifiable { }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
