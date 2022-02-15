//
//  AnimationReactionView.swift
//  ArithmeticAce
//
//  Created by Lillian Yang on 2022-02-14.
//

import SwiftUI

struct AnimationReactionView: View {
    
    //MARK: Stored Properties
    let answerCorrect: Bool
    let answerChecked: Bool
    
    //MARK: Computed Properties
    
    var body: some View {
        
        ZStack {
            LottieView(animationNamed: "51926-happy")
                .opacity(answerCorrect == true ? 1.0 : 0.0)
                .padding()

            LottieView(animationNamed: "91726-sad-guy-is-walking")
                .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                .padding()
        }
    }
}

struct AnimationReactionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationReactionView(answerCorrect: true, answerChecked: false)
    }
}
