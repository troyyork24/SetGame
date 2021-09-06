//
//  CardShadingView.swift
//  Set-CS193p
//
//  Created by Troy Thomas York on 9/6/21.
//

import SwiftUI

struct CardShadingView: View {
    let symbolView: CardSymbolView
    let cardShading: CardShading
    let color: Color
    
    
    var body: some View {
        switch cardShading {
            case .open:
                ZStack {
                    symbolView.fill().foregroundColor(.white)
                    symbolView.stroke(lineWidth: 2).foregroundColor(color)
                }
            case .striped:
                CardStripedView(cardShapes: symbolView, color: color)
            case .solid:
                symbolView.fill().foregroundColor(color)
        }
    }
}

struct CardShadingView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameViewModel().setModel.dealtDeck.first!
        let color = SetGameViewModel().switchColors(card)

        CardShadingView(symbolView: CardSymbolView(shape: card.shape), cardShading: card.shading, color: color)
    }
}
