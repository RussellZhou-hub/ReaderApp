//
//  TabNoteData.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/13.
//

import Foundation
import SwiftUI

// Model
// 此数据需要在存取过程中进行JSON编码与解码，因此标注为遵守Codable协议；
// 此数据需要在SWiftUI中以列表的方式显示给用户，因此需要遵守Identifiable协议
struct Note: Codable, Identifiable{
    var id: UUID
    var title: String
    var content: String
    var imageURLAppendix: String?
}

// ModelView
class TabNoteData: ObservableObject {
    @Published var notes: [Note] = []
    
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init(){
        notes = getNotes()
    }
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        if FileManager.default.fileExists(atPath: notesURL.path){
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        return result
    }
    
    func saveNotes(){
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
    
    func getImage(_ imageURLAppendix: String) -> UIImage {
        let url = TabNoteData.sandboxURL.appendingPathComponent(imageURLAppendix)
        let imageData = try! Data(contentsOf: url)
        return UIImage(data: imageData,scale: 1.0 )!
    }
    func saveImage(id: UUID,data: Data){
        DispatchQueue.global(qos: .userInitiated).async {
            let url = TabNoteData.sandboxURL.appendingPathComponent("\(id).png")
            try? data.write(to: url)
        }
    }
}
