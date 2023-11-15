//
//  Settings.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/11.
//

import SwiftUI

struct Settings: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        Button(action: {
            Vibration.selection.vibrate()
            darkMode.toggle()}){
            Image(systemName: darkMode ? "sun.max.fill": "moon.fill" )
                .font(.system(.headline,design: .rounded))
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Settings(darkMode: .constant(false))
    }
}
