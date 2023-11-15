//
//  firstDemoApp.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/10/24.
//

import SwiftUI
import LocalAuthentication

@main
struct ReaderApp: App {
    let motionManager = MotionManager()
    @State var locked = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if locked {
                    //Locked(authorize: authorize)
                    TabView{
                        Master()
                            .environmentObject(motionManager)
                            .tabItem {
                                Label("阅读列表", systemImage: "books.vertical")
                            }
                        ReadingNote()
                            .tabItem {
                                Label("笔记", systemImage: "note.text")
                            }
                    }
                } else {
                    TabView{
                        Master()
                            .environmentObject(motionManager)
                            .tabItem {
                                Label("阅读列表", systemImage: "books.vertical")
                            }
                        ReadingNote()
                            .tabItem {
                                Label("笔记", systemImage: "note.text")
                            }
                        CheckIn()
                            .tabItem {
                                Label("签到",systemImage: "mapping.and.ellipse")
                            }
                    }
                    
                }
            }
            .onAppear { authorize() }
        }
    }
    
    func authorize(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,localizedReason: "解锁应用"){ result, _ in
                
            }
        }
    }
}
