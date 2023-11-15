//
//  Detail.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/10.
//

import SwiftUI

struct Detail: View{
    var article: Article
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text(article.body)
            }
            .padding()
        }
        .navigationTitle(article.title)
    }
}

struct Detail_Previews: PreviewProvider{
    static var previews:some View{
        Detail(article: Article(id:0,title:"title",body:"body"))
    }

}
