//
//  ContentView.swift
//  AnimatedTabView
//
//  Created by Kusal Rajapaksha on 2024-01-16.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Color.purple
                .ignoresSafeArea()
            
            TabView(selectedTab: $selectedTab, images: ["house","bookmark","message","person"])
        })
    }
}

#Preview {
    ContentView()
}
