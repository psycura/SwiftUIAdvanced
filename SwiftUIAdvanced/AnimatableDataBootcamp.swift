//
//  CustomShapeAnimations.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
    
    @State private var animate: Bool = false
    
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: animate ? 60 : 0)
//                .scale(animate ? 1.1 : 1)
//                .frame(width: 250, height: 250)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
            Pacman(offset: animate ? 20 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
            }
            
        }
    }
}

#Preview {
    AnimatableDataBootcamp()
}


struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY ))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: .zero)
    
 
        }
    }
}

struct Pacman: Shape {
    
    var offset: Double
    
    var animatableData: Double {
        get { offset }
        set { offset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX , y: rect.minY ),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offset),
                endAngle: Angle(degrees: 360 - offset),
                clockwise: false
            )

        }
    }
    
}
