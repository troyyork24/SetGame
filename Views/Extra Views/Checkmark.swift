//
//  Checkmark.swift
//  Set-CS193p (iOS)
//
//  Created by Troy York on 9/1/21.
//

import SwiftUI

struct Checkmark: Shape {
    func path(in rect: CGRect) -> Path {
        let upperIndent = CGPoint(x: rect.midX / 1.5 , y: rect.midY * 1.3)
        let topCheck = CGPoint(x: rect.midX / 3.5, y: rect.midY)
        let bottomLeftCheck = CGPoint(x: rect.midX / 3.5, y: rect.midY * 1.2)
        let bottomIndent = CGPoint(x: rect.midX / 1.5, y: rect.midY * 1.5)
        let topRightLeftCheck = CGPoint(x: rect.maxX / 1.2, y: rect.midY / 1.7)
        let topRightRightCheck = CGPoint(x: rect.maxX / 1.2, y: rect.midY / 2.7)
        
        
        var path = Path()
        
        path.move(to: upperIndent)
        path.addLines([topCheck, bottomLeftCheck, bottomIndent, topRightLeftCheck, topRightRightCheck, upperIndent, topCheck])
        
        return path.path(in: rect)
    }
    
}

struct CheckmarkView: View {
    var body: some View {
        Checkmark()
    }
}

struct Checkmark_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkView()
    }
}
