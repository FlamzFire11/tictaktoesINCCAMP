//
//  ContentView.swift
//  tictaktoes
//
//  Created by souper shy on 12/11/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // A NavigationLink to the TicTacToeGridView
                    NavigationLink(destination: TicTacToeView(), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView2(), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView3(), label: {
                        Text("Board 3")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                }
                HStack {
                    // A NavigationLink to the TicTacToeGridView
                    NavigationLink(destination: TicTacToeView4(), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView5(), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView6(), label: {
                        Text("Board 3")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                }
                HStack {
                    // A NavigationLink to the TicTacToeGridView
                    NavigationLink(destination: TicTacToeView7(), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView8(), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView9(), label: {
                        Text("Board 3")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                }
                
            }
            .navigationTitle("Main Menu")
        }

            }
        }

#Preview {
    ContentView()
}


