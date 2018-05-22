module Main where

fip :: Float -> Float -> Float -> Float -> Float -> Float
fip hr bb hbp k ip = ((13 * hr) + (3 * (bb + hbp)) - (2 * k)) / ip + 3.139

xFip :: Float -> Float -> Float -> Float -> Float -> Float -> Float
xFip fb lgFb bb hbp k ip = ((13 * (fb * lgFb)) + (3 * (bb + hbp)) - (2 * k)) / ip + 3.139

main :: IO ()
main = do
  print(fip 4 14 3 84 68.67)
  print(xFip 87 0.128 14 3 84 68.67)
