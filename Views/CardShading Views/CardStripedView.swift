//
//  StripedView.swift
//  Set-CS193p
//
//  Created by Troy Thomas York on 9/6/21.
//

import SwiftUI

struct CardStripedView<CardShapes>: View where CardShapes: Shape {
    let numberOfStripes = 3
    let lineWidth: CGFloat = 2
    let borderLineWidth: CGFloat = 2
    let cardShapes: CardShapes
    let color: Color
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfStripes) { number in
                Color.white
                color.frame(width: lineWidth)
                if number == numberOfStripes - 1 {
                    Color.white
                }
            }
        }
        .mask(cardShapes)
        .overlay(cardShapes.stroke(color, lineWidth: borderLineWidth))
    }
}

struct CardStripedView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameViewModel().setModel.dealtDeck.first!
        let color = SetGameViewModel().switchColors(card)
        
        CardStripedView(cardShapes: CardSymbolView(shape: card.shape), color: color)
    }
}
