//
//  SetGameViewRedo.swift
//  Set-CS193p
//
//  Created by Troy Thomas York on 8/28/21.
//

import SwiftUI

struct SetGameViewRedo: View {
    @State var opacity = true
    var body: some View {
        
        VStack
            {
                
                Button("Tap") {
                    opacity.toggle()
                }
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
            ZStack {
                if opacity == false {
                    XShape()
                        
                }
            }
            
           
        }
    }
}
extension Animation {
    
}
struct CardsView: View {
    let card: SetGameModel.Card
    
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
            rect.fill().foregroundColor(.white)
            rect.stroke()
        }
    }
}
struct SetGameViewRedo_Previews: PreviewProvider {
    static var previews: some View {
        SetGameViewRedo()
    }
}
