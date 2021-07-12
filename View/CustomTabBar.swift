//
//  CustomTabBar.swift
//  UI-258
//
//  Created by nyannyan0328 on 2021/07/12.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var current : String
    var body: some View {
        HStack(spacing:0){
            
            TabButton(title: "For you", image: "rectangle.portrait", selected: $current)
            
            TabButton(title: "Search", image: "magnifyingglass", selected: $current)
            
            TabButton(title: "Following", image: "bookmark", selected: $current)
            
            
            TabButton(title: "DownLoad", image: "square.and.arrow.up.fill", selected: $current)
            
            
            
            
        }
        .frame(height: 70)
        .background(.quaternary)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton : View{
    
    var title : String
    var image : String
    @Binding var selected : String
    
    var body: some View{
        
        Button {
            
            withAnimation{
                
                
                selected = title
            }
            
        } label: {
            
            VStack{
                
                
                Image(systemName: image)
                    .font(.title2)
                
                Text(title)
                    .font(.footnote.bold())
                
                
                
            }
            .foregroundColor(selected == title ? .primary : .gray)
            .frame(maxWidth: .infinity)
            
            
            
        }

        
        
    }
}
