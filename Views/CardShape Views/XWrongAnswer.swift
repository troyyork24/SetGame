//
//  XWrongAnswer.swift
//  Set-CS193p (iOS)
//
//  Created by Troy Thomas York on 8/27/21.
//

import SwiftUI

struct XShape: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 200, height: 50, alignment: .center)
                .rotationEffect(.degrees(60))
            Capsule()
                .frame(width: 200, height: 50, alignment: .center)
                .rotationEffect(.degrees(120))
        }
        .foregroundColor(.red)
    }
}

struct XWrongAnswer_Previews: PreviewProvider {
    static var previews: some View {
        XShape()
    }
}
