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
    @State var hideDebug: Bool = false
    @State var hardMode: Bool = false
    
    var body: some View {
        Group { // The grid
            VStack {
                if gameStatus != 0 {
                    if gameStatus == 1 || gameStatus == -1 {
                        Spacer(minLength: 30)
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
                        #if targetEnvironment(macCatalyst)
                        let spacing = UIScreen.main.bounds.width / 20
                        #elseif os(tvOS)
                        let spacing = UIScreen.main.bounds.width / 20
                        #else
                        let spacing = UIScreen.main.bounds.width / 8
                        #endif
                        ForEach((0...5), id: \.self) {
                            if $0 > entriesArray.count - 1 {
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
                                HStack(spacing: spacing) {
                                     if answer[0] == word[0] {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Green"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[0]) {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Yellow"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[0])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Grey"))
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
                                                    .foregroundColor(Color("Green"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[1]) {
                                        Text(word[1])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Yellow"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[1])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Grey"))
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
                                                    .foregroundColor(Color("Green"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[2]) {
                                        Text(word[2])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Yellow"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[2])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Grey"))
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
                                                    .foregroundColor(Color("Green"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[3]) {
                                        Text(word[3])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Yellow"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[3])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Grey"))
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
                                                    .foregroundColor(Color("Green"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else if answer.contains(word[4]) {
                                        Text(word[4])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Yellow"))
                                                    .scaledToFill()
                                                    .cornerRadius(10)
                                            }
                                    } else {
                                        Text(word[4])
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .regular, design: .monospaced))
                                            .background {
                                                Rectangle()
                                                    .foregroundColor(Color("Grey"))
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
                                .foregroundColor(.white)
                                .opacity(0.2)
                        }
                }
                if gameStatus == 0 {
                    #if targetEnvironment(macCatalyst)
                    let spacing = UIScreen.main.bounds.width / 20
                    #else
                    let spacing = UIScreen.main.bounds.width / 10
                    #endif
                    TextField("Have a guess!", text: $txtField)
                        .padding(.horizontal, spacing)
                        #if !os(tvOS)
                        .textFieldStyle(.roundedBorder)
                        #endif
                        .onSubmit {
                            if txtField.count < 5 || String(txtField.prefix(5)).contains(" ") {
                                txtField = ""
                                #if !os(tvOS)
                                let generator = UIImpactFeedbackGenerator(style: .heavy)
                                generator.impactOccurred(intensity: 5)
                                #endif
                            } else {
                                var words: String!
                                if let path = Bundle.main.path(forResource: "check", ofType: "json") {
                                    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
                                    words = String(decoding: data, as: UTF8.self)
                                }
                                
                                if words.contains("\"\(txtField)\"") {entriesArray.append(String(txtField.prefix(5)))}
                                else if hardMode == false {entriesArray.append(String(txtField.prefix(5)))}
                                txtField = ""
                                #if !os(tvOS)
                                let generator = UINotificationFeedbackGenerator()
                                generator.prepare()
                                #endif
                                // game status check
                                if entriesArray.last?.uppercased() == answer {
#if !os(tvOS)
                                    generator.notificationOccurred(.success)
#endif
                                    gameStatus = 1
                                } else if entriesArray.count == 6 {
#if !os(tvOS)
                                    generator.notificationOccurred(.error)
#endif
                                    gameStatus = -1
                                } else {
#if !os(tvOS)
                                    generator.notificationOccurred(.warning)
#endif
                                }
                            }
                        }
                    
                    
                    
                    #if DEBUG
                    if !hideDebug {Text("debugging only: \(answer)")
                        .onLongPressGesture {
                            hideDebug.toggle()
                        }}
                    #endif
                    
                    
                    
                    Toggle(isOn: $hardMode) {
                        Text("Hard Mode")
                    }
                    .frame(minWidth: 100, idealWidth: 200, maxWidth: 400)
                    .padding()
                    .background {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color("Grey"))
                            .padding(.horizontal, 5)
                            .opacity(0.2)
                            .onLongPressGesture {
                                entriesArray.removeLast()
                            }
                    }
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

