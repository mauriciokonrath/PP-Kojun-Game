module Colors where

-- a repo of colors in ANSI format

translateColor :: Integer -> String
translateColor colorId = (colors !! ( fromIntegral colorId ))


colors = [red, green, yellow, blue, magenta, cyan]

endColor  =    "\ESC[0m"

red       =    "\ESC[1;31m"
green     =    "\ESC[1;32m"
yellow    =    "\ESC[1;33m"
blue      =    "\ESC[1;34m"
magenta   =    "\ESC[1;35m"
cyan      =    "\ESC[1;36m"
