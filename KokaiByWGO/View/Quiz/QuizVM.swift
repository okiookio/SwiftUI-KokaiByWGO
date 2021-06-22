//
//  QuizVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-07.
//

import Foundation


class QuizVM: ObservableObject {
    
    @Published var choicesIndex: [Int] = []
    @Published var quizAnswerIndex = 0
    @Published var quizProgress = 0
    @Published var score = 0
    
    func resetQuiz() {
        quizProgress = 0
        score = 0
    }
    
    func loadQuizChoices(numberOfRows: Int) {
        quizProgress += 1
        getQuizChoices(repetitions: 4, maxValue: numberOfRows-1)
        quizAnswerIndex = choicesIndex.randomElement()!
    }

    func getQuizChoices(repetitions: Int, maxValue: Int) {
        guard maxValue >= repetitions else {
            fatalError("maxValue must be >= repetitions for the numbers to be unique")
        }
        choicesIndex = []
        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = Int(arc4random_uniform(UInt32(maxValue + 1)))
            } while choicesIndex.contains(n)
            choicesIndex.append(n)
        }
    } 
    
}
