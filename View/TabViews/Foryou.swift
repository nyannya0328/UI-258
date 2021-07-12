//
//  Foryou.swift
//  UI-258
//
//  Created by nyannyan0328 on 2021/07/12.
//

import SwiftUI

struct Foryou: View {
    
    var topEdge : CGFloat
    var body: some View {
        VStack(spacing:15){
            
            HStack{
                
                Text("Todays For You")
                    .font(.largeTitle.weight(.heavy))
                    .foregroundColor(.purple)
                Spacer(minLength: 20)
                
                
                Image(systemName: "person.circle")
                    .font(.title)
                    .overlay(
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .offset(x: -3, y: 1)
                        .shadow(radius: 5)
                    
                    
                    ,alignment: .topTrailing
                    
                    )
                
                
            }
            .padding(.horizontal)
            .frame(height: 70)
            
            
            GeometryReader{proxy in
                let size = proxy.size
                
                
               
                        
                        VerticalCaluselView {
                            
                            
                            VStack(spacing:0){
                                
                                ForEach(animals){animal in
                            
                            
                                    AnimalCardView(animal: animal, topoofset: 70 + 15 + topEdge)
                                        .frame(width: size.width, height: size.height)
                            
                            
                        }
                        
                        
                        
                    }
                }
                        
                
                
            }
        }
    }
}

struct Foryou_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCardView : View{
    
    var animal : Animal
    
    var topoofset : CGFloat
    
    var body: some View{
        
       
            
            GeometryReader{proxy in
                
                let size = proxy.size
                    
                    let minY = proxy.frame(in:.global).minY - topoofset
                    let progress = -minY / size.height
                    let scale = 1 - (progress / 3)
                let opa = 1 - progress
                ZStack(){
                    
                    
               
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 70)
                    .cornerRadius(10)
                
                    
                    Text(animal.title)
                       
                
                        
                
                
            }
               .scaleEffect(minY < 0 ? scale : 1)
               .opacity(minY < 0 ? opa : 1)
               .offset(y: minY < 0 ? -minY : 0)
                
                
                .padding(.horizontal,15)
            
            
        }
    }
}
