//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-08.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...143)
    @State var addend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "+", firstValue: augend, secondValue: addend)
            
            Divider()
            
           AnswerAndResultView(answerChecked: answerChecked, answerCorrect: answerCorrect, inputGiven: $inputGiven)
            
            ZStack {
                
               CheckAnswerButtonView(answerChecked: $answerChecked, answerCorrect: $answerCorrect, inputGiven: inputGiven, correctSolution: correctSum)
                
                Button(action: {
                    // Generate a new question
                    augend = Int.random(in: 1...143)
                    addend = Int.random(in: 1...144-augend)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
         
            // Reaction animation
           AnimationReactionView(answerCorrect: true, answerChecked: false)
            
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
        //A black of clode that runs once
        .task {
            addend = Int.random(in: 1...144-augend)
        }
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
