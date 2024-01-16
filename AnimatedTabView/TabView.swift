//
//  TabView.swift
//  AnimatedTabView
//
//  Created by Kusal Rajapaksha on 2024-01-16.
//

import SwiftUI

struct TabView: View {
    
    @Binding var selectedTab: String
    var tabViewHeight: CGFloat = 50
    @State var cornerRadius: CGFloat = 10
    @State var curveHeight: CGFloat = 15
    
    var images: [String]
    
    var body: some View {
        VStack{
            Spacer()
            HStack(spacing: 0){
                //--Tab buttons
                ForEach(0..<images.count, id: \.self){index in
                    let image = images[index]
                    TabButton(image: image, selectedTab: $selectedTab, cornerRadius: $cornerRadius, curveHeight: $curveHeight)
                }
                
            }
            .frame(height: tabViewHeight)
            .background(
                Color.white
                    .cornerRadius(cornerRadius)
                    .clipped()
            )
        }
        .frame(height: tabViewHeight + curveHeight )
        .padding()
    }
}

struct TabButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var cornerRadius: CGFloat
    @Binding var curveHeight: CGFloat
        
    var body: some View {
        
        GeometryReader{ geometry -> AnyView in
            
            
            return AnyView(
                Button(action: {
                    withAnimation(.linear(duration: 0.15)) {
                        selectedTab = image
                    }
                    
                }, label: {
                    Image(systemName: image)
                        .foregroundColor(.black)
                        .offset(y: selectedTab == image ? -10 : 0)
                        .scaleEffect(selectedTab == image ? 1.5 : 1.0)
                        
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(alignment: .top, content: {
                    TabCurve()
                        .fill(Color.white)
                        .frame(width: geometry.frame(in: .global).width - cornerRadius * 2, height:curveHeight)
                        .offset(y: selectedTab == image ? -curveHeight : 0)
                })
            )
        }
    
        
    }
}

#Preview {
    ContentView()
}

#Preview {
    TabView(selectedTab: Binding.constant("house"), images: ["house","bookmark","message","person"])
}
