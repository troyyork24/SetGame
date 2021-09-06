//
//  CardSymbolView.swift
//  Set-CS193p
//
//  Created by Troy Thomas York on 9/6/21.
//

import SwiftUI

struct CardSymbolView: Shape {
    let shape: CardShape
    
    func path(in rect: CGRect) -> Path {
        switch shape {
            case .capsule:
                return Capsule().path(in: rect)
            case .diamond:
                return DiamondShape().path(in: rect)
            case .squiggle:
                return SquiggleShape().path(in: rect)
        }
        
    }
}
struct CardSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        CardSymbolView(shape: .squiggle)
    }
}
