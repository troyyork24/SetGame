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
            CardListView(setGameVM: setGameVM)
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
