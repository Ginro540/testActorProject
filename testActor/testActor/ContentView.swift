//
//  ContentView.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = ViewModel()

    var body: some View {
        
        VStack {
            Text(model.message ?? "")
                .padding()
            Button("push me") {
                didTapButton()
            }
        }
    }
    
    func didTapButton() {
        
        Task {
            let result = await model.fetchMessage(url: "push")
            print("result \(result ?? "")")
            
            let result2 = await model.fetchMessage(url: "push")
            print("result2 \(result2 ?? "")")
            
            let result3 = await model.fetchMessage(url: "push")
            print("result3 \(result3 ?? "")")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
