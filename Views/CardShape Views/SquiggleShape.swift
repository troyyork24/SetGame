//
//  SquiggleShape.swift
//  Set
//
//  Created by Troy Thomas York on 8/11/21.
//

import SwiftUI

struct SquiggleShape: Shape {
  
       
       func path(in rect: CGRect) -> Path {
         
           
           var path = Path()
           
           path.move(to: CGPoint(x: rect.minX, y: rect.midY))
           path.addCurve(
               to: CGPoint(
                   x: rect.minX + rect.size.width * 0.70,
                   y: rect.minY + rect.size.height * 0.20
               ),
               control1: CGPoint(
                   x: rect.minX + rect.size.width * 0.05,
                   y: rect.minY - rect.size.height * 0.40
               ),
               control2: CGPoint(
                   x: rect.midX,
                   y: rect.minY + rect.size.height * 0.20
               )
           )
           path.addCurve(
               to: CGPoint(
                   x: rect.maxX,
                   y: rect.midY
               ),
               control1: CGPoint(
                   x: rect.minX + rect.size.width * 0.95,
                   y: rect.minY + rect.size.height * 0.20
               ),
               control2: CGPoint(
                   x: rect.maxX,
                   y: rect.minY - rect.size.height * 0.40
               )
           )
           path.addCurve(
               to: CGPoint(
                   x: rect.minX + rect.size.width * 0.30,
                   y: rect.minY + rect.size.height * 0.80
               ),
               control1: CGPoint(
                   x: rect.minX + rect.size.width * 0.95,
                   y: rect.maxY + rect.size.height * 0.40
               ),
               control2: CGPoint(
                   x: rect.midX,
                   y: rect.minY + rect.size.height * 0.80
               )
           )
           path.addCurve(
               to: CGPoint(
                   x: rect.minX,
                   y: rect.midY),
               control1: CGPoint(
                   x: rect.minX + rect.size.width * 0.05,
                   y: rect.minY + rect.size.height * 0.80),
               control2: CGPoint(
                   x: rect.minX,
                   y: rect.maxY + rect.size.height * 0.40))
           
           return path
       }
}

struct SquiggleShape_Previews: PreviewProvider {
    static var previews: some View {
        SquiggleShape()
    }
}
