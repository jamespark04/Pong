module Constants where

import Graphics.Gloss

fieldWidth, fieldHeight :: Float
fieldHeight = 300
fieldWidth = 600

fieldWidthInt, fieldHeightInt :: Int
fieldHeightInt = 300
fieldWidthInt = 600

data Field = Field{field_loc :: Location, width :: Float, height :: Float}

blankField = Field{field_loc = (0,0), width = fieldWidth, height = fieldHeight}

fieldBackground :: Color
fieldBackground = white

renderField :: Field -> Picture
renderField (f@Field{field_loc = (x,y), width = w, height = h}) =
  color black (lineLoop path)
  where
    fx = fromIntegral x
    fy = fromIntegral y
    path = [(fx, fy), (fx + w, fy), (fx + w, fy + h), (fx, fy + h)]

type Location = (Int, Int)

windowWidth, windowHeight :: Int
windowHeight = 500 
windowWidth = 800

windowWidthF, windowHeightF :: Float
windowHeightF = 500 
windowWidthF = 800

windowX, windowY :: Int
windowX = 200
windowY = 200

border :: Float
border = 25