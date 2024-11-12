//
//  Untitled.swift
//  tictaktoes
//
//  Created by souper shy on 12/11/24.
//
import SwiftUI

// Game logic and view
struct TicTacToeView: View {
    
    @State private var board: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var currentPlayer: String = "X"
    @State private var winner: String?
    
    let primaryColor = Color(hex: "#D980fa")
    
    var body: some View {
        VStack {
            // Title and Winner Display
            Text(winner == nil ? "\(currentPlayer)'s Turn" : "\(winner!) Wins!")
                .font(.title)
                .foregroundColor(primaryColor)
                .padding()
            
            // The Tic-Tac-Toe Grid
            VStack(spacing: 0) {
                ForEach(0..<3, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<3, id: \.self) { col in
                            Button(action: {
                                makeMove(row: row, col: col)
                            }) {
                                Text(board[row][col])
                                    .font(.system(size: 40))
                                    .foregroundColor(primaryColor)
                                    .frame(width: 100, height: 100)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .border(primaryColor, width: 2)
                                    .padding(2)
                            }
                            .disabled(board[row][col] != "" || winner != nil)
                        }
                    }
                }
            }
            .padding()
            
            // Restart Button
            if winner != nil {
                Button(action: restartGame) {
                    Text("Restart Game")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(primaryColor)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
    
    // Handle player's move
    func makeMove(row: Int, col: Int) {
        if board[row][col] == "" && winner == nil {
            board[row][col] = currentPlayer
            if checkForWinner() {
                winner = currentPlayer
            } else {
                currentPlayer = (currentPlayer == "X") ? "O" : "X"
            }
        }
    }
    
    // Check if there's a winner
    func checkForWinner() -> Bool {
        // Check rows, columns, and diagonals
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
    
    // Restart the game
    func restartGame() {
        board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        currentPlayer = "X"
        winner = nil
    }
}

// Color extension for hex color values
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
