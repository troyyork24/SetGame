//
//  ScrollForMoreCardsView.swift
//  Set-CS193p (iOS)
//
//  Created by Troy Thomas York on 9/5/21.
//

import SwiftUI

struct ScrollForMoreCardsView: View {
    var body: some View {
        VStack {
            Text("SCROLL")
            Spacer(minLength: 15)
            HStack {
                Image(systemName: "arrow.down")
                Image(systemName: "arrow.down")
            }
        }
        .foregroundColor(.white)
    }
}

struct ScrollForMoreCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollForMoreCardsView()
    }
}
