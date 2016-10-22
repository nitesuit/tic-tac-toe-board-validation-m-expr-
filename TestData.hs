module TicTacToe.Messages.MExpr
where

{-
message to validate
board:
+-+-+-+
|O|X| |
+-+-+-+
| | |#|
+-+-+-+
|X| |O|
+-+-+-+
-}
message :: String
message = "l[l[\"x\"; 1; \"y\";  2; \"v\";  \"x\"];   l[\"x\";   0;  \"y\"; 0;   \"v\";  \"o\"]; l[\"x\";  0;  \"y\"; 1; \"v\";  \"x\"];   l[\"x\";   2;  \"y\";   2;   \"v\"; \"o\"]; l[\"x\"; 2;  \"y\";   0;  \"v\";  \"x\"];   l[\"x\";   1; \"y\";  2; \"v\";  \"x\"]]"