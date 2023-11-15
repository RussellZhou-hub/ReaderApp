//
//  ReadingNote.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/12.
//

import SwiftUI
import BetterSafariView

struct ReadingNote: View{
    @State private var presentingSafariView = false
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Link(destination: URL(string: "https://legolas.me")!){
                        RoundButton(text: "在Safari中打开",image: "safari")
                    }
                    
                    Button(action: {
                        self.presentingSafariView=true
                    }){
                        RoundButton(text: "在本应用中打开",image: "arrow.up.forward.app")
                    }
                    .safariView(isPresented: $presentingSafariView){
                        SafariView(
                            url: URL(string: "https://legolas.me")!,
                            configuration: SafariView.Configuration(
                                entersReaderIfAvailable: true,
                                barCollapsingEnabled: true
                            )
                        )
                    }
                }
                .navigationTitle("笔记")
                NoteEntryAndList()
                Spacer()
            }
            
        }
    }
}

struct ReadingNote_Previews: PreviewProvider {
    static var previews:some View {
        ReadingNote()
    }
}
