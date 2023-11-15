//
//  CheckIn.swift
//  firstDemo
//
//  Created by VincentZhou on 2023/11/16.
//

import SwiftUI
import MapKit

struct CheckIn: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $locationManager.region)
        }
    }
}

struct CheckIn_Previews: PreviewProvider{
    static var previews: some View{
        CheckIn()
    }
}
