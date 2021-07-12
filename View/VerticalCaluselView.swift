//
//  VerticalCaluselView.swift
//  UI-258
//
//  Created by nyannyan0328 on 2021/07/12.
//

import SwiftUI

struct VerticalCaluselView<Content : View>: UIViewRepresentable {
    
    
    var content : Content
    
    init(@ViewBuilder content : @escaping()->Content){
        
        self.content = content()
        
    }
    func makeUIView(context: Context) -> UIScrollView {
        
        
        let scroll = UIScrollView()
        
        setUP(scroll: scroll)
        
        
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func setUP(scroll : UIScrollView){
      
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.backgroundColor = .purple
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constains = [
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            
            hostView.view.widthAnchor.constraint(equalTo: scroll.widthAnchor),
        
        
        ]
        
        scroll.addSubview(hostView.view)
        scroll.addConstraints(constains)
      
        
        
        
        
        
        
    }
}

