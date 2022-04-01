//
//  ContentView.swift
//  Shared
//
//  Created by llsc12 on 31/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var txtField:String = ""
    @State var gameStatus = 0 //-1 is lose, 0 is playing, 1 is win!
    @State var answer: String = ""
    @State var answerDef: String = ""
    @State var entriesArray: [String] = []
    
    var body: some View {
        Group { // The grid
            VStack {
                if gameStatus != 0 {
                    if gameStatus == 1 || gameStatus == -1 {
                        Text(gameStatus == 1 ? "You win!" : "You lost!")
                            .tracking(2)
                            .font(.title)
                            .foregroundColor(.gray)
                        Button {
                            var words: wordset?
                            if let path = Bundle.main.path(forResource: "words", ofType: "json") {
                                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
                                words = try? JSONDecoder().decode(wordset.self, from: data)
                            }
                            let random = words?.randomElement()
                            answer = random!.word.uppercased()
                            answerDef = random!.def
                            
                            entriesArray.removeAll()
                            gameStatus = 0
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width / 20)
                        }
                        Spacer()
                        ScrollView {
                            Text(answer.lowercased().capitalizingFirstLetter())
                                .font(.title2)
                            Text(answerDef)
                                .padding()
                        }
                        Spacer()
                    }
                } else {
                    Text("Wordle!")
                        .tracking(2)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    
                    VStack(spacing: UIScreen.main.bounds.height / 25 ) {// row collection
                        ForEach((0...4), id: \.self) {
                            if $0 > entriesArray.count - 1 {
                                #if targetEnvironment(macCatalyst)
                                let spacing = UIScreen.main.bounds.width / 20
                                #else
                                let spacing = UIScreen.main.bounds.width / 8
                                #endif
                                HStack(spacing: spacing) {
                                    Text(" ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .scaledToFill()
                                                .cornerRadius(10)
                                                .opacity(0.5)
                                        }
                                    Text(" ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .scaledToFill()
                                                .cornerRadius(10)
                                                .opacity(0.5)
                                        }
                                    Text(" ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .scaledToFill()
                                                .cornerRadius(10)
                                                .opacity(0.5)
                                        }
                                    Text(" ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .scaledToFill()
                                                .cornerRadius(10)
                                                .opacity(0.5)
                                        }
                                    Text(" ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .scaledToFill()
                                                .cornerRadius(10)
                                                .opacity(0.5)
                                        }
                                }
                            } else {
                                let word = entriesArray[$0].uppercased()
                                HStack(spacing: UIScreen.main.bounds.width / 8) {
                                     if answer[0] == word[0] {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.green)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[0]) {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.orange)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.gray)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    }
                                    
                                    if answer[1] == word[1] {
                                        Text(word[1])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.green)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[1]) {
                                        Text(word[1])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.orange)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[1])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.gray)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    }
                                    
                                    if answer[2] == word[2] {
                                        Text(word[2])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.green)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[2]) {
                                        Text(word[2])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.orange)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[2])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.gray)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    }
                                    
                                    if answer[3] == word[3] {
                                        Text(word[3])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.green)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[3]) {
                                        Text(word[3])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.orange)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[3])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.gray)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    }
                                    
                                    if answer[4] == word[4] {
                                        Text(word[4])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.green)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[4]) {
                                        Text(word[4])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.orange)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[4])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(.gray)
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    }
                                }
                            }
                        }
                    }
                        .padding(20)
                        .background {
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                                .opacity(0.5)
                        }
                }
                if gameStatus == 0 {
                    TextField("Have a guess!", text: $txtField)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            if txtField.count != 5 {
                                txtField = ""
                                let generator = UIImpactFeedbackGenerator(style: .heavy)
                                generator.impactOccurred(intensity: 5)
                            } else {
                                entriesArray.append(txtField)
                                txtField = ""
                                let generator = UINotificationFeedbackGenerator()
                                generator.prepare()
                                generator.notificationOccurred(.warning)
                                
                                // game status check
                                if entriesArray.last?.uppercased() == answer {
                                    gameStatus = 1
                                } else if entriesArray.count == 5 {
                                    gameStatus = -1
                                }
                            }
                        }
                    #if DEBUG
                    Text("debugging only: \(answer)")
                    #endif
                }
            }
        }
        .onAppear {
            var words: wordset?
            if let path = Bundle.main.path(forResource: "words", ofType: "json") {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
                words = try? JSONDecoder().decode(wordset.self, from: data)
            }
            let random = words?.randomElement()
            answer = random!.word.uppercased()
            answerDef = random!.def
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension StringProtocol {
    subscript(offset: Int) -> String {
        String(self[index(startIndex, offsetBy: offset)])
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

struct word: Codable {
    let word, def: String
}

typealias wordset = [word]

