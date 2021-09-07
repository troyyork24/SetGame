//
//  SetGameViewModel.swift
//  Set
//
//  Created by Troy York on 8/13/21.
//

import Foundation
import SwiftUI

class SetGameViewModel: ObservableObject {
    typealias Card = SetGameModel.Card
    
    @Published var setModel = SetGameModel()
    
    init() {
        loadNewGame()
    }
    func choose( _ card: SetGameModel.Card) {
        setModel.choose(card)
    }
    func dealCards(upTo: Int) {
        setModel.dealCards(upTo: upTo)
    }
    func loadNewGame() {
        self.setModel = SetGameModel()
        setModel.dealCards(upTo: 12)
    }
    func winRemoval() {
        setModel.winRemoval()
    }
    func showScrollPopUp() {
        setModel.showScrollPopUp.toggle()
    }
    func xRemoval() {
        setModel.removeXs()
    }
    func switchColors(_ card: SetGameModel.Card) -> Color {
        switch card.color {
            case .green:
                return .green
            case .purple:
                return .purple
            case .red:
                return .red
        }
    }
    var score: Int {
        setModel.score
    }
    var cardsLeftInDeck: Int {
        setModel.deck.count
    }
    var showingScrollPopUp: Bool {
        setModel.showScrollPopUp
    }
}
