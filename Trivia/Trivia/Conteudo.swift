//
//  ConteudoModel.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 21/06/22.
//

import Foundation

struct Question {
    let question: String
    let answer: Bool
    let category: Int
}

final class Conteudo {
    static let shared = Conteudo()
    
    private init(){}
    
    func obterPerguntas() -> [Question] {
        return [Question(question: "A Argentina tem 3 copas do mundo em futebol?", answer: false, category: 1),
                 Question(question: "A capital do Chile é Santiago?", answer: true, category: 2),
                 Question(question: "O dia tem 24 horas?", answer: true, category: 3),
                 Question(question: "O mês de Junho, tem 31 dias?", answer: false, category: 3),
                 Question(question: "2 + 2 = 3", answer: false, category: 3),
                 Question(question: "1024 Gigabytes é 1 Terabyte.", answer: true, category: 3),
                 Question(question: "A glândula tireóides, está no cérebro?", answer: false, category: 3),
                 Question(question: "O intestino delgado mede entre 5 e 8 metros.", answer: true, category: 3),
                 Question(question: "O primeiro país a organizar uma Copa do Mundo foi o Uruguai.", answer: true, category: 1),
                 Question(question: "A Grande Muralha da China é visível da Lua.", answer: false, category: 3),
                 Question(question: "A Rússia tem 11 fusos horários.", answer: true, category: 2),
        ]
    }
}
