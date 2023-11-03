//
//  CustomShapesWithCurves.swift
//  SwiftUIAdvanced
//
//  Created by Eugene Alitz on 14/10/2023.
//

import SwiftUI

struct CustomShapesWithCurves: View {
    var body: some View {
//        ArcSample()
//        ShapeWithArc()
//        QuadSample()
        WaterShape()
            .fill(LinearGradient(
                gradient: Gradient(
                    colors: [Color.red, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing
                    )
            )
//            .stroke(lineWidth: 5)
//            .frame(width: 200, height: 200)
            .ignoresSafeArea()

    }
}

#Preview {
    CustomShapesWithCurves()
}

struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true
            )
                
        }
    }

}


struct ShapeWithArc: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height/2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

                
        }
    }

}

struct QuadSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.minY),
                control: CGPoint(x: rect.minX, y: rect.maxY)
            )
            
        }
    }
    
}


struct WaterShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.6)
            )
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
    
}
