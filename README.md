# tic-tac-toe-board-validation-m-expr-
TicTacToe board validation in Haskel

Validates TicTacToe board, which is given in m-expr format without dictionaries:

Example: "l[l[\"x\";  0;   \"y\";  2; \"v\";  \"x\"];   l[\"x\";  0;  \"y\";   0;  \"v\";   \"o\"]; l[\"x\"; 1;  \"y\"; 1; \"v\";   \"x\"]]"

Tic-Tac-Toe board is invalid if:
1. NumberOfMoves('x') != NumberOfMoves('o')
   AND NumberOfMoves('x') != NumberOfMoves('o') + 1 (As 'x' start the game)
2. 'x' and 'o' appears in the same position of the board

Usage:

1. Load GHCI (https://www.haskell.org/ghc/)
2. Load TicTacToe and TestData modules using: < :l TicTacToe TestData >
3. call 'validate' function which takes one parameter 'message', which is unparsed m-expr string
4. validate function returns either 'True' or 'False'
