//
//  ContentView.swift
//  DV Lottery Game
//
//  Created by Alexander Bonney on 5/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chanceToWin = [Bool]()
    
    @State private var choosenAnswer = false
    
    @State private var text = ""
    
    @State private var tryAmount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(text).padding()
                
                Button("Check") {
                    // checking
                    game()
                }.frame(width: 200, height: 50, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .disabled(choosenAnswer)
                
                Text("Your attempts: \(tryAmount)").padding()
                
            }
            .navigationTitle("DV Lottery simulator")
            .navigationBarItems(trailing: Button("Restart") {
                restart()
            })
        }.onAppear(perform: {
            fill()
        })
    }
    
    func fill() {
        for _ in 1..<2_518 {
            chanceToWin.append(false)
        }
        for _ in 1..<36 {
            chanceToWin.append(true)
        }
    }
    
    func game() {
        let randomNumber = Int.random(in: 1..<chanceToWin.count)
        choosenAnswer = chanceToWin[randomNumber]
        
        if choosenAnswer {
            text = "Success! You have been randomly selected!"
        } else {
            text = "Try again"
        }
        tryAmount += 1
    }
    
    func restart() {
        tryAmount = 0
        text = ""
        choosenAnswer = false
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
