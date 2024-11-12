//
//  TicTacToeView 5.swift
//  tiktaktoes
//
//  Created by Nguyen Dylan on 12/11/24.
//


import SwiftUI

struct TicTacToeView6: View {

    // The game state: Board (3x3 array), current player, winner
    @State private var board: [[String]] = [
        ["", "", ""], // Row 1
        ["", "", ""], // Row 2
        ["", "", ""]  // Row 3
    ]
    
    @Binding var currentPlayer: String 
    @State private var winner: String = ""  // Empty string means no winner
    
    // Define the custom color #D980FA
    let primaryColor = Color(hex: 0xD980FA)
    
    // Main body of the view
    var body: some View {
        NavigationStack {
            VStack {
                // Display current turn, winner message, or draw message
                if winner == "" {
                    Text("\(currentPlayer)'s Turn")
                        .font(.title)
                        .foregroundColor(primaryColor)
                        .padding()
                } else if winner == "Draw" {
                    Text("It's a Draw!")
                        .font(.title)
                        .foregroundColor(primaryColor)
                        .padding()
                } else {
                    Text("\(winner) Wins!")
                        .font(.title)
                        .foregroundColor(primaryColor)
                        .padding()
                }
                
                // Create the Tic-Tac-Toe grid
                VStack {
                    ForEach(0..<3, id: \.self) { row in
                        HStack {
                            // Create a column of buttons for each row
                            ForEach(0..<3) { col in
                                Button(action: {
                                    makeMove(row: row, col: col)
                                }) {
                                    Text(board[row][col])
                                        .font(.system(size: 40))
                                        .frame(width: 100, height: 100)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .border(primaryColor, width: 2)
                                        .foregroundColor(primaryColor)
                                }
                            }
                        }
                    }
                }
                .padding()
                
                // Restart button (only visible if there is a winner or draw)
                if winner != "" {
                    Button(action: restartGame) {
                        Text("Restart Game")
                            .font(.title2)
                            .padding()
                            .background(primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .padding()
            .navigationTitle("Tic-Tac-Toe")
        }
    }
    
    // Function to handle a player's move
    func makeMove(row: Int, col: Int) {
        // Only proceed if the cell is empty and there is no winner or draw
        if board[row][col] == "" && winner == "" {
            board[row][col] = currentPlayer
            
            // Check for winner after the move
            if checkForWinner() {
                winner = currentPlayer
            } else if checkForDraw() {
                winner = "Draw"
            } else {
                // Switch turns between X and O
                currentPlayer = (currentPlayer == "X") ? "O" : "X"
            }
        }
    }
    
    // Function to check if a player has won
    func checkForWinner() -> Bool {
        // Check rows, columns, and diagonals for a win
        for i in 0..<3 {
            if board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer {
                return true
            }
            if board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer {
                return true
            }
        }
        
        if board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer {
            return true
        }
        
        if board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer {
            return true
        }
        
        return false
    }
    
    // Function to check for a draw (if the board is full and there's no winner)
    func checkForDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell == "" {
                    return false
                }
            }
        }
        return true
    }
    
    // Function to restart the game
    func restartGame() {
        board = [
            ["", "", ""], // Row 1
            ["", "", ""], // Row 2
            ["", "", ""]  // Row 3
        ]
        currentPlayer = "X"
        winner = ""  // Reset winner
    }
}

struct TicTacToeView_Previews6: PreviewProvider {
    static var previews: some View {
        TicTacToeView(currentPlayer: .constant("X"))
    }
}
