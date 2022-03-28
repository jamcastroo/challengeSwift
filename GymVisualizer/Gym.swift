
//  jamile.swift
//  CBL-PROJECT
//
//  Created by Tales Valente on 08/03/22.
//

import Foundation

class Gym {

    func runApp() {
        menu()
    }
    
    //Uma struct que representa um exercicio
    //Um exercicio é composto por nome, numero de series e numero de repeticoes
    //Cada uma dessas coisas dão origem as propriedades da struct
    struct Exercise {
        var name: String
        var numberOfSeries: Int
        var numberOfRepetitions: Int
    }

    //Input usuário
    //getAnswer tem um paramêtro do tipo string que é a pergunta a ser feita
    //E ela retornar uma String que é o input do usuário
    // -> Significa que a função retorna o tipo após a seta, nesse caso uma String
    func getAnswer(for question: String) -> String {
        //mostra a pergunta no console
        print(question)
        //Recebe o input do usuário através do readLine()
        let answer = readLine()!
        //Retorna esse input para quem chamou a função
        return answer
    }

    //getAnswerInt recebe uma paramêtro de pergunta do tipo String e retorna um inteiro
    func getAnswerInt(for question: String) -> Int {
        //Mostra no terminal a pergunta
        print(question)
        //Cria uma variavel answerInt que é do tipo Inteiro e Optional, por padrão ela é nil ( Não possuí valor )
        var answerInt: Int? = nil
        //Cria um loop que enquanto a resposta não for um inteiro ela pede novamento o input do usuário
        //Até que a resposta seja um inteiro
        while answerInt == nil {
            //cria uma constante para a resposta do usuario que é uma string
            let answer = readLine()!
            //converte a resposta de string para inteiro, se a conversão der errado, recebe um nil e continua no loop
            //se a conversão der certo, sai do loop e vai para a próxima instrução
            answerInt = Int(answer)
        }
        //Após o usuário entrar um valor válido, sai do loop e retorna um inteiro
        return answerInt!
    }

    //Dados do programa
    //Um variavel que cria um array de Exercise que é a struct definida no começo do arquivo,o array começa vazio
    var exercises: [Exercise] = []
    //Variavel que controla qual o exercicio atual, para percorrer o array ao começar o treino
    //Começa como primeiro item do array que é 0
    var currentExercise = 0

    //Funções do sistema
    //Essa função obtém as propriedades do exercicio através do input do usuário, e cria um objeto exercicio
    //Após criação, adiciona o novo exercicio ao array de exercises
    func createExercise() {
        //Pega o input do usuário que é uma string e dois int
        let exerciseName = getAnswer(for: "Qual o nome do exercicio?")
        let numberOfSeries = getAnswerInt(for: "Quantas séries ele possuí?")
        let numberOfRepetitions = getAnswerInt(for: "Quantas repetições?")

        //Cria uma constante e atribui a ela uma nova instância de exercise, com os inputs recebidos anteriormente
        // Para criar um novo objeto usamos o chamado construtor que é uma função
        //Essa função recebe como paramêtros, as propriedades da struct
        //Usamos então o input do usuário que pedimos acima, para passar como paramêtro dessa função
        //Criando um novo exercicio com esses paramêtros
        let newExercise = Exercise(name: exerciseName, numberOfSeries: numberOfSeries, numberOfRepetitions: numberOfRepetitions)
        //Adiciona ao array exercises o novo objeto
        exercises.append(newExercise)
    }

    //Pega os parametros do exercise e mostra de uma maneira legivel para o usuário no terminal
    //Recebe como paramêtro um objeto do tipo Exercise
    func printExercise(exercise: Exercise) {
        //Utiliza Multiline String para formatar a mensagem, permitindo utilizar quebra de linha sem o \n
        print("""
              Exercício: \(exercise.name)
              número de séries: \(exercise.numberOfRepetitions)
              repetições: \(exercise.numberOfRepetitions)
              """)
    }

    //Mostra no terminal a descrição do exercicio atual
    //E adiciona 1 ao currentExercise para próxima vez que for chamada mostrar o próximo exercício do array
    func printCurrentExercise() {
        //atribui a constante o exercicio do array na posição atual que é definida pela váriavel currentExercise
        //Rever acesso de array
        let exercise = exercises[currentExercise]
        //Utiliza a função printExercise para mostrar no terminal os dados do exercicio atual
        printExercise(exercise: exercise)
        //Soma 1 ao currentExercise, simulando a passagem de exercicio
        currentExercise += 1
    }

    //Função que mostra no terminal todos os exercicios cadastrados
    func allExercises() {
        //Usa o multiline para printar um cabeçalho antes de mostrar os exercicios
        print("""
                ***************************
                *        Exercícios       *
                ***************************
                """)
        //Usa um loop pra mostrar um exercicio dentro do array de exercicios um por um
        //Rever for em arrays e entender melhor como funcionam através de vários exercicios
        for exercise in exercises {
            //Utiliza a função print exercise pra mostrar no terminal de uma maneira mais agradavel pro usuário
            printExercise(exercise: exercise)
        }
    }

    func workout(){
        if currentExercise < exercises.count {
            let exercise = exercises[currentExercise]
            var series = exercise.numberOfSeries
            print("Começando exercicio \(exercise.name)")
            while series > 0 {
                let command = getAnswer(for: "acabou a serie?").lowercased()
                //Se ele tiver acabado a serie, diminuir em 1 o numero de series restantes
                //Perguntar ao usuario se ele acabou a serie
                if command == "y" {
                    series -= 1
                    print("Série: \(series) de \(exercise.numberOfSeries)")
                }
            }
            print("Você acabou o exercicio")
            currentExercise += 1
        } else {
            print("não tem mais exercicios")
        }
    }

    //Menu Principal
    //Comentar como funciona o menu principal
    func menu() {
    let menu = """
               ***************************
               *        Academia         *
               ***************************
               1 - Cadastrar exercicio
               2 - Visualizar exercicio atual
               3 - Visualizar exercicios
               4 - Treinar
               5 - Sair
               """
    var command = 99
    while command != 5 {
        print(menu)
        command = getAnswerInt(for: "Escolha uma opção do menu")
        if command == 1 {
            createExercise()
        } else if command == 2 {
            printCurrentExercise()
        } else if command == 3 {
            allExercises()
        } else if command == 4 {
            workout()
        }
    }
    print("....Saindo do programa")
}
}


