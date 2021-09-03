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
                .frame(width: 80, height: 20)
                .rotationEffect(.degrees(60))
            Capsule()
                .frame(width: 80, height: 20)
                .rotationEffect(.degrees(120))
        }
        .foregroundColor(.red)
        .frame(width: 65, height: 95)
        
    }
}

struct XWrongAnswer_Previews: PreviewProvider {
    static var previews: some View {
        XShape()
    }
}
