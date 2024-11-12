//
//  Untitled.swift
//  tictaktoes
//
//  Created by souper shy on 12/11/24.
//
import SwiftUI

// The main view for Tic-Tac-Toe
struct TicTacToeView: View {
    
    // The game state: Board (3x3 array), current player, winner
    @State private var board: [[String]] = [
        ["", "", ""], // Row 1
        ["", "", ""], // Row 2
        ["", "", ""]  // Row 3
    ]
    
    @State private var currentPlayer: String = "X"
    @State private var winner: String? = nil
    
    // Define the custom color #D980FA
    let primaryColor = Color(hex: "#D980FA")
    
    // Main body of the view
    var body: some View {
        NavigationStack {
            VStack {
                // Display current turn or winner message
                Text(winner == nil ? "\(currentPlayer)'s Turn" : "\(winner!) Wins!")
                    .font(.title)
                    .foregroundColor(primaryColor)
                    .padding()
                
                // Create the Tic-Tac-Toe grid
                VStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { row in
                        HStack(spacing: 0) {
                            // Create a column of buttons for each row
                            ForEach(0..<3, id: \.self) { col in
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
                                .disabled(board[row][col] != "" || winner != nil)
                            }
                        }
                    }
                }
                .padding()
                
                // Restart button (only visible if there is a winner)
                if winner != nil {
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
            .background(Color.white)  // The background color of the game board
            .cornerRadius(15)
            .shadow(radius: 10)
            .navigationTitle("Tic-Tac-Toe")
        }
    }
    
    // Function to handle a player's move
    func makeMove(row: Int, col: Int) {
        // Only proceed if the cell is empty and there is no winner
        if board[row][col] == "" && winner == nil {
            board[row][col] = currentPlayer
            
            // Check for winner after the move
            if checkForWinner() {
                winner = currentPlayer
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
    
    // Function to restart the game
    func restartGame() {
        board = [
            ["", "", ""], // Row 1
            ["", "", ""], // Row 2
            ["", "", ""]  // Row 3
        ]
        currentPlayer = "X"
        winner = nil
    }
}

// Color extension to handle hex code color
extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        if hexSanitized.count == 6 {
            let scanner = Scanner(string: hexSanitized)
            var rgb: UInt64 = 0
            scanner.scanHexInt64(&rgb)
            
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue)
        } else {
            self.init(red: 0, green: 0, blue: 0)
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
