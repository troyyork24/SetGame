//
//  SetGameModel.swift
//  Set
//
//  Created by Troy York on 8/13/21.
//

import Foundation

struct SetGameModel {
    private(set) var deck: Array<Card>
    private(set) var dealtDeck: Array<Card>
    private(set) var selectedCardsDeck: Array<Card>
    var score: Int
    var showScrollPopUp = false
    
    init() {
        deck = Array<Card>()
        dealtDeck = Array<Card>()
        selectedCardsDeck = Array<Card>()
        score = 0
        for shape in CardShape.allCases {
            for shading in CardShading.allCases {
                for color in CardColor.allCases {
                    for number in 1...3 {
                        let card = Card(shape: shape, shading: shading, color: color, numberOfShapes: number)
                        deck.append(card)
                    }
                }
            }
            deck.shuffle()
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = dealtDeck.firstIndex(where: { $0.id == card.id }) {
            if dealtDeck.contains(where: {$0.state == .matched}) {
                dealtDeck.removeAll(where: {$0.state == .matched})
                
            }
            if dealtDeck.contains(where: {$0.state == .mismatched}) {
                dealtDeck.indices.forEach { dealtDeck[$0].state = .unselected }
                selectedCardsDeck.removeAll()
            }
            switchState(dealtDeck[chosenIndex])
            selectedCardsDeck = dealtDeck.filter { $0.state == .isSelected }
            matchSelectedCards()
            
        }
    }
    mutating func switchState(_ card: Card) {
        if let chosenIndex = dealtDeck.firstIndex(where: { $0.id == card.id }) {
            switch dealtDeck[chosenIndex].state {
                case .mismatched:
                    return dealtDeck[chosenIndex].state = .isSelected
                case .isSelected:
                    return dealtDeck[chosenIndex].state = .unselected
                case .unselected:
                    return dealtDeck[chosenIndex].state = .isSelected
                default:
                    return dealtDeck[chosenIndex].state = .unselected
            }
        }
    }
    mutating func matchSelectedCards() {
        if selectedCardsDeck.count == 3 {
            
                //sameDiffShape = All same or different characteristics
                let sameDiffShape = selectedCardsDeck[0].shape == selectedCardsDeck[1].shape && selectedCardsDeck[0].shape == selectedCardsDeck[2].shape && selectedCardsDeck[1].shape == selectedCardsDeck[2].shape || selectedCardsDeck[0].shape != selectedCardsDeck[1].shape && selectedCardsDeck[0].shape != selectedCardsDeck[2].shape && selectedCardsDeck[1].shape != selectedCardsDeck[2].shape
                let sameDiffShading = selectedCardsDeck[0].shading == selectedCardsDeck[1].shading && selectedCardsDeck[0].shading == selectedCardsDeck[2].shading && selectedCardsDeck[1].shading == selectedCardsDeck[2].shading || selectedCardsDeck[0].shading != selectedCardsDeck[1].shading && selectedCardsDeck[0].shading != selectedCardsDeck[2].shading && selectedCardsDeck[1].shading != selectedCardsDeck[2].shading
                let sameDiffColor = selectedCardsDeck[0].color == selectedCardsDeck[1].color && selectedCardsDeck[0].color == selectedCardsDeck[2].color && selectedCardsDeck[1].color == selectedCardsDeck[2].color || selectedCardsDeck[0].color != selectedCardsDeck[1].color && selectedCardsDeck[0].color != selectedCardsDeck[2].color && selectedCardsDeck[1].color != selectedCardsDeck[2].color
                let sameDiffNumber = selectedCardsDeck[0].numberOfShapes == selectedCardsDeck[1].numberOfShapes && selectedCardsDeck[0].numberOfShapes == selectedCardsDeck[2].numberOfShapes && selectedCardsDeck[1].numberOfShapes == selectedCardsDeck[2].numberOfShapes || selectedCardsDeck[0].numberOfShapes != selectedCardsDeck[1].numberOfShapes && selectedCardsDeck[0].numberOfShapes != selectedCardsDeck[2].numberOfShapes && selectedCardsDeck[1].numberOfShapes != selectedCardsDeck[2].numberOfShapes
            
            if sameDiffShape && sameDiffShading && sameDiffColor && sameDiffNumber {
                for card in selectedCardsDeck {
                    win(card)
                }
                score += 3
            } else {
                for card in selectedCardsDeck {
                    if let eachCard = dealtDeck.firstIndex(where: { $0.id == card.id}) {
                        dealtDeck[eachCard].state = .mismatched
                    }
                }
                score -= 1
            }
        }
    }
    mutating func win(_ card: Card) {
        if let eachCard = dealtDeck.firstIndex(where: { $0.id == card.id}) {
            dealtDeck[eachCard].state = .matched
        }
    }
    mutating func removeXs() {
        dealtDeck.indices.forEach {dealtDeck[$0].state = .unselected}
    }
    mutating func winRemoval() {
        dealtDeck.removeAll(where: {$0.state == .matched })
        selectedCardsDeck.removeAll()
        dealCards(upTo: 3)
    }
    mutating func dealCards(upTo: Int) {
        if dealtDeck.contains(where: { $0.state == .mismatched}) {
            dealtDeck.indices.forEach( { dealtDeck[$0].state = .unselected})
        }
        if deck.count > 0 {
            let min = min(deck.count - 1, upTo - 1)
            for _ in 0...min {
                let card = deck.removeFirst()
                dealtDeck.append(card)
            }
        }
    }
    struct Card: Identifiable {
        var id = UUID()
        var shape: CardShape
        var shading: CardShading
        var color: CardColor
        var numberOfShapes: Int
        var state: CardState = .unselected
    }
}
enum CardShape: CaseIterable {
    case diamond, squiggle, capsule
}
enum CardShading: CaseIterable {
    case open, striped, solid
}
enum CardColor: CaseIterable {
    case red, green, purple
}
enum CardState {
    case mismatched, matched, isSelected, unselected
}
