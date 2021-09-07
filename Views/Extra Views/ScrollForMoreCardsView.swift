//
//  ScrollForMoreCardsView.swift
//  Set-CS193p (iOS)
//
//  Created by Troy Thomas York on 9/5/21.
//

import SwiftUI

struct ScrollForMoreCardsView: View {
    var body: some View {
        
        ZStack {
           LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .bottom, endPoint: .trailing).ignoresSafeArea()
            VStack {
                Spacer()
                Text("""
                    SCROLL
                    FOR
                    MORE
                    CARDS
                    """).multilineTextAlignment(.center).font(.system(size: 30))
                Spacer()
                HStack {
                    Image(systemName: "arrow.down").resizable().scaleEffect(0.3)
                    Image(systemName: "arrow.down").resizable().scaleEffect(0.3)
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct ScrollForMoreCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollForMoreCardsView()
    }
}
