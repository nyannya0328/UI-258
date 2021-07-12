//
//  Home.swift
//  UI-258
//
//  Created by nyannyan0328 on 2021/07/12.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "For you"
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$currentTab){
            
            GeometryReader{proxy in
                
                let edge = proxy.safeAreaInsets.top
                
                Foryou(topEdge: edge)
                    .padding(.top,edge)
                    .ignoresSafeArea(.all, edges: .top)
            }
                .tag("For you")
            
            Text("Search")
                .tag("Search")
            
            Text("Foollowing")
                .tag("Foollowing")
            
            Text("DownLoad")
                .tag("DownLoad")
            
            
        }
        .overlay(CustomTabBar(current: $currentTab),alignment: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
