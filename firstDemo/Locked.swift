//
//  Locked.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/12.
//

import SwiftUI

struct Locked: View{
    let authorize: () -> ()
    
    var body: some View {
        VStack{
            Image(systemName: "lock.shield")
                .font(.system(.largeTitle, design: .rounded))
                .padding(.bottom,50)
            Button(action:{
                authorize()
                Vibration.light.vibrate()
            }){
                Text("轻点在此尝试解锁")
                    .bold()
            }
        }
    }
}
