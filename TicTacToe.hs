module TicTacToe
where

import Data.Char
import TicTacToe.Messages.MExpr -- :l TicTacToe TestData

-- DATA Structures (ADT)

data Position = Position {
  coord :: Coord
  , v :: Char
} deriving Show

data Coord = Coord {
  x :: Int
  , y :: Int
} deriving Show

instance Eq Coord where -- kaip lyginti koordinates
  (Coord a1 b1) == (Coord a2 b2) =
    a1 == a2 && b1 == b2

-- Validation

printMessage :: String -> String
printMessage message = message 

validate :: String -> Bool
validate message = 
    validateEqualNumberOfMoves (getPositions [] message)
 && validatePositions (getPositions [] message)

validateEqualNumberOfMoves :: [Position] -> Bool -- jei x vienu daugiau ar lygiai su o - lenta valydi
validateEqualNumberOfMoves positions =
    if (countPlayers 'x' positions) == (countPlayers 'o' positions)
    || (countPlayers 'x' positions) == ((countPlayers 'o' positions) + 1) 
    then True
    else False

validatePositions :: [Position] -> Bool -- ar nera dvieju ar daugiau zaideju toje pacioje pozicijoje
validatePositions positions =
  validatePositions' True positions
  where
    validatePositions' :: Bool -> [Position] -> Bool 
    validatePositions' valid [] = valid
    validatePositions' valid (h:t) =
      if (countPlayersAtPosition h positions) > 1 
        then validatePositions' False t
        else validatePositions' valid t

-- Parsing functions

getPositions :: [Position] -> String -> [Position]
getPositions positions message =
    let 
      (position, restFromPosition) = getPosition message
    in
      if restFromPosition == "\"]]"
      then (positions ++ [position])
      else getPositions (positions ++ [position]) restFromPosition


getPosition :: String -> (Position, String) 
getPosition message =
    let
      (coord, restFromCoord) = getCoord message
      (player, restFromPlayer) = getPlayer restFromCoord
    in ((Position coord player), restFromPlayer)

getCoord :: String -> (Coord, String) 
getCoord message = 
    let 
      (x, restFromX) = getNumber message
      (y, restFromY) = getNumber restFromX
    in ((Coord x y), restFromY)

getNumber :: String -> (Int, String)
getNumber ('0':rest) = (0, rest)
getNumber ('1':rest) = (1, rest)
getNumber ('2':rest) = (2, rest)
getNumber (c:rest) = getNumber rest

getPlayer :: String -> (Char, String)
getPlayer ('x':rest) = ('x', rest)
getPlayer ('o':rest) = ('o', rest)
getPlayer (c:rest) = getPlayer rest

-- Counters

countPlayersAtPosition :: Position -> [Position] -> Int
countPlayersAtPosition position positions =
    countPlayersAtPosition' 0 position positions
    where
      countPlayersAtPosition' :: Int -> Position -> [Position] -> Int
      countPlayersAtPosition' acc position [] = acc
      countPlayersAtPosition' acc position (h:t) =
        if (getCoordFromPosition position) == (getCoordFromPosition h)
          then countPlayersAtPosition' (acc + 1) position t
          else countPlayersAtPosition' acc position t


countPlayers :: Char -> [Position] -> Int
countPlayers player positions = 
    countPlayers' 0 player positions 
    where
      countPlayers' :: Int -> Char -> [Position] -> Int
      countPlayers' acc player [] = acc
      countPlayers' acc player (h:t) =
        if (getPlayerFromPosition h) == player
          then countPlayers' (acc + 1) player t
          else countPlayers' acc player t

-- Helper functions

getCoordFromPosition :: Position -> Coord
getCoordFromPosition (Position coord _) = coord

getXFromCoord :: Coord -> Int
getXFromCoord (Coord x _) = x

getYFromCoord :: Coord -> Int
getYFromCoord (Coord _ y) = y

getPlayerFromPosition :: Position -> Char
getPlayerFromPosition (Position _ p) = p






