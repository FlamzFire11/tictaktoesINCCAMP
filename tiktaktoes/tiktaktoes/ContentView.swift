//
//  ContentView.swift
//  tiktaktoes
//
//  Created by Nguyen Dylan on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPlayer = "X"
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // A NavigationLink to the TicTacToeGridView
                    NavigationLink(destination: TicTacToeView(currentPlayer: $currentPlayer), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView2(currentPlayer: $currentPlayer), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView3(currentPlayer: $currentPlayer), label: {
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
                    NavigationLink(destination: TicTacToeView4(currentPlayer: $currentPlayer), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView5(currentPlayer: $currentPlayer), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView6(currentPlayer: $currentPlayer), label: {
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
                    NavigationLink(destination: TicTacToeView7(currentPlayer: $currentPlayer), label: {
                        Text("Board 1")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView8(currentPlayer: $currentPlayer), label: {
                        Text("Board 2")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                    NavigationLink(destination: TicTacToeView9(currentPlayer: $currentPlayer), label: {
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
