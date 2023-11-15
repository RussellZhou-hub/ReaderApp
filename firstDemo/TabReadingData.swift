//
//  Data.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/10/30.
//

import SwiftUI

// Mark: - Model
struct Article: Codable, Identifiable {
    var id: Int
    var title: String
    var body:String
}

// Mark: - ViewModel
class TabReadingData:ObservableObject{
    @Published var articles = [Article]()
    
    init(){
        let url = URL(string:"https://www.legolas.me/s/articles.json")!
        
        URLSession.shared.dataTask(with:url){ (data,response,error) in
            DispatchQueue.main.async{
                self.articles = try! JSONDecoder().decode([Article].self,from:data!)
            }
        }.resume()
    }
}
