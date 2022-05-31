module Colors where

-- a repo of colors in ANSI format

-- class Colors String where
--     red :: String       "\ESC[31m"
--     green :: String     "\ESC[32m"
--     yellow :: String    "\ESC[33m"
--     blue :: String      "\ESC[34m"
--     magenta :: String   "\ESC[35m"
--     cyan :: String      "\ESC[36m"
--
-- getColor :: String -> String
-- getColor "red"      =
-- getColor "green"    =   "\ESC[32m"
-- getColor "yellow"   =
-- getColor "blue"     =
-- getColor "magenta"  =
-- getColor "cyan"     =

pattern red       =    "\ESC[31m"
pattern green     =    "\ESC[32m"
pattern yellow    =    "\ESC[33m"
pattern blue      =    "\ESC[34m"
pattern magenta   =    "\ESC[35m"
pattern can       =    "\ESC[36m"
