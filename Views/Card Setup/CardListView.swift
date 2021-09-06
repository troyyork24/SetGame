//
//  CardListView.swift
//  Set-CS193p
//
//  Created by Troy Thomas York on 9/6/21.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject var setGameVM: SetGameViewModel
    
    var body: some View {
        AspectVGrid(items: setGameVM.setModel.dealtDeck, aspectRatio: 2/3, content: { card in
            CardView(setGameVM: setGameVM, card: card)
                .onTapGesture {
                    setGameVM.choose(card)
                }
                .padding(4)
        })
    }
}
struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        
        CardListView(setGameVM: game)
    }
}
