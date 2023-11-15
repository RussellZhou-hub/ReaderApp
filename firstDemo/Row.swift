//
//  Row.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/10/30.
//

import SwiftUI

struct Row: View {
    var article: Article
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
    VStack(alignment: .leading){
            //Image(systemName: "globe")
            //    .imageScale(.large)
            //    .foregroundStyle(.tint)
        Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom,3)
                .scaleEffect(max(1, (0.7 + -motion.y * 0.45)))
        Text(article.body)
            .lineLimit(3)
            .scaleEffect(max(1,(0.7 + -motion.y * 0.37 )))
        }
        .padding()
    }
}


struct Row_Previews:PreviewProvider {
    static var previews:some View {
        Row(article: Article(id:1,title:"title",body:"body"))
            .environmentObject(MotionManager())
    }
}
