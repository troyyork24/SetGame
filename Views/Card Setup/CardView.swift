//
//  CardView.swift
//  Set-CS193p
//
//  Created by Troy York on 9/5/21.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var setGameVM: SetGameViewModel
    let card: SetGameModel.Card
    
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: SetGameViewConstants.cardCornerRadius)
        let color = SetGameViewModel().switchColors(card)
        let isSelected = card.state == .isSelected ? 0.2 : 1
        let wrongAnswer = card.state == .mismatched || card.state == .matched
        ZStack {
            
            // card white background
            cardShape.fill().foregroundColor(.white)
            // color border
            cardShape
                .strokeBorder(lineWidth: SetGameViewConstants.cardLineWidth)
                .foregroundColor(color)
                .opacity(isSelected)
            
            // card content
            ZStack {
                GeometryReader { geometry in
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                                CardShadingView(symbolView: CardSymbolView(shape: card.shape),cardShading: card.shading, color: color)
                                    .frame(width: geometry.size.width/3, height: geometry.size.height/6, alignment: .center)}
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .opacity(isSelected)
            }
            .opacity(wrongAnswer  ? 0.2 : 1)
        }
        .overlay(
            ZStack {
                if card.state == .mismatched {
                    XShape()
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { setGameVM.xRemoval()})
                        }
                }
                if card.state == .matched {
                    Checkmark()
                        .foregroundColor(.green)
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { setGameVM.winRemoval()})
                        }
                    
                }
            }
            .animation(wrongAnswer ? .easeInOut(duration: 2).speed(15).repeatCount(5) : .none)
        )
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        let card = game.setModel.dealtDeck.first!
        
        CardView(setGameVM: game, card: card)
    }
}
