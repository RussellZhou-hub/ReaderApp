//
//  ContentView.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/10/24.
//

import SwiftUI
import LocalAuthentication

// Mark: - View
struct Master: View {
    @StateObject var data = TabReadingData()
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView{
            List(data.articles) { article in
                NavigationLink(destination: Detail(article: article)){
                    Row(article:article)
                }
            }
            .navigationTitle("编辑推荐")
            .toolbar{
                Settings(darkMode: $darkMode)
            }
        }
        .preferredColorScheme(darkMode ? .dark:.light)
    }
}

//#Preview {
//    ContentView()
//}

struct ContentView_Previews:PreviewProvider {
    
    static var previews:some View {
        Master()
            .environmentObject(MotionManager())
    }
}


