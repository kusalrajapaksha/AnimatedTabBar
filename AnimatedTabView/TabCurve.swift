//
//  TabCurve.swift
//  AnimatedTabView
//
//  Created by Kusal Rajapaksha on 2024-01-16.
//

import SwiftUI

struct TabCurve: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in

            let mid = rect.width/2
            
            path.move(to: CGPoint(x: 0, y: rect.height))
            
            let to = CGPoint(x: mid, y: 0)
            let contor1 = CGPoint(x: rect.width/4, y: rect.height)
            let contor2 = CGPoint(x: mid - rect.width/4, y: 0)
            
            let to1 = CGPoint(x: rect.width, y: rect.height)
            let contor3 = CGPoint(x: mid+rect.width/4, y: 0)
            let contor4 = CGPoint(x: rect.width - rect.width/4, y: rect.height)
            
            path.addCurve(to: to, control1: contor1, control2: contor2)
            path.addCurve(to: to1, control1: contor3, control2: contor4)
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
        }
    }
}

#Preview {
    TabCurve()
        .frame(width: 50,height: 10)
}
