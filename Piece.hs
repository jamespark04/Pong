module Piece where

import Constants

import Graphics.Gloss

import System.Random.TF.Instances
import System.Random.TF.Gen
import Data.Monoid
import Control.Arrow

data Piece = Piece {piece_loc :: Location}
data Ball = Ball {ball_loc :: Location, vel_x :: Int, vel_y :: Int }

ballRadius :: Float
ballRadius = 5

ballRadiusInt :: Int
ballRadiusInt = 5

renderRectangle :: Piece -> Picture
renderRectangle p@Piece{piece_loc = (x, y)} =
  color blue (polygon path) <>
  color black (line    path)
  where
    fx = fromIntegral x
    fy = fromIntegral y
    path = [(fx, fy), (fx+10, fy), (fx+10, fy+50), (fx, fy+50)]

renderCircle :: Ball -> Picture
renderCircle b@Ball{ball_loc = (x, y)} =
  translate (fromIntegral x) (fromIntegral y) $
  (color black (circleSolid ballRadius))

initial_left_piece = Piece{piece_loc = (0,(fieldHeightInt `div` 2) - 20)}
initial_right_piece= Piece{piece_loc = (fieldWidthInt - 10,fieldHeightInt `div` 2)}
first_ball= Ball{ball_loc = (fieldWidthInt `div` 2, fieldHeightInt `div` 2), vel_x = (-5), vel_y = (-5)}



