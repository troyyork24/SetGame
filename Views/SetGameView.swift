//
//  SetGameView.swift
//  Set
//
//  Created by Troy York on 8/9/21.
//

import SwiftUI


struct SetGameView: View {
    @ObservedObject var setGameVM = SetGameViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Set!").font(.largeTitle).foregroundColor(.black)
            HStack {
                Spacer()
                Text("Score: \(setGameVM.score)")
                    .foregroundColor(.black)
                    .padding()
                Spacer()
                Text("Remaining Cards: \(setGameVM.cardsLeftInDeck)")
                    .foregroundColor(.black)
                    .padding()
                Spacer()
            }
            Rectangle().frame(width: 200, height: 1).background(Color.white)
            CardsListView(setGameViewModel: setGameVM)
                .padding(.horizontal)
            
            HStack {
                Spacer()
                Button("New Game") {
                    setGameVM.loadNewGame()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                Spacer()
                Button("Deal Cards") {
                    setGameVM.dealCards(upTo: 3)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                Spacer()
            }
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .bottom, endPoint: .trailing).ignoresSafeArea().animation(.easeIn))
    }
}
struct CardsListView: View {
    @ObservedObject var setGameViewModel: SetGameViewModel
    
    var body: some View {
        AspectVGrid(items: setGameViewModel.setModel.dealtDeck, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .onTapGesture {
                    setGameViewModel.choose(card)
                }
                .padding(4)
        })
    }
}
struct CardView: View {
@ObservedObject var setGameVM = SetGameViewModel()
let card: SetGameModel.Card

  

var body: some View {
    let cardShape = RoundedRectangle(cornerRadius: SetGameViewConstants.cardCornerRadius)
    let color = SetGameViewModel().switchColors(card)
    let isSelected = card.state == .isSelected ? 0.2 : 1
    let wrongAnswer = card.state == .mismatched || card.state == .matched
    ZStack {
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
                                CardContentView(symbolView: SymbolView(shape: card.shape),cardShading: card.shading, color: color)
                                    .frame(width: geometry.size.width/3, height: geometry.size.height/6, alignment: .center)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .opacity(isSelected)
            }
            .opacity(wrongAnswer  ? 0.2 : 1)
        }
        ZStack {
            if card.state == .mismatched {
                XShape()
            }
            if card.state == .matched {
                Checkmark()
                    .foregroundColor(.green)
//                Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { _ in setGameVM.winRemoval() } )
            }
        }
            .animation(wrongAnswer ? .easeInOut(duration: 2).speed(15).repeatCount(5) : .none)
        
    }
}


}
struct CardContentView: View {
    let symbolView: SymbolView
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
                StripedView(content: symbolView, color: color)
            case .solid:
                symbolView.fill().foregroundColor(color)
        }
    }
}
struct StripedView<Content>: View where Content: Shape {
    let numberOfStripes = 3
    let lineWidth: CGFloat = 2
    let borderLineWidth: CGFloat = 2
    let content: Content
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
        .mask(content)
        .overlay(content.stroke(color, lineWidth: borderLineWidth))
    }
}
struct SymbolView: Shape {
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
struct SetGameViewConstants {
    static let cardCornerRadius: CGFloat = 10
    static let padding4: CGFloat = 4
    static let cardLineWidth: CGFloat = 4
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
extension AnyTransition {
    
}
