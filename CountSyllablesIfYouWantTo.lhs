"The apparition of these faces in the crowd; petals on a wet, black bough" -Ezra Pound

"Furu ike ya
kawazu tobikomu
mizu no oto"
-Matsuo Basho

This code is disgusting and should be stopped

I don't think I have anything else to say about it.

Unfortunate plumbing, rusting below signification. It's too far down for
me to polish up, make something story-shaped out of.

\begin{code}
module Syllables where

import Data.Char

en_vowels :: String
en_vowels = ['a','e','i','o','u']
en_consonants :: String
en_consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']
en_letters :: String
en_letters = en_vowels ++ en_consonants

isVowel :: Char -> Bool
isVowel c
    | c `elem` en_vowels = True
    | otherwise = False


isConsonant :: Char -> Bool
isConsonant c
    | c `elem` en_consonants = True
    | otherwise = False
    
\end{code}

What follows is the cobbled together pile of shit that tries to count syllables.

It can't handle abbreviations or contractions

It has problems with things that end with "es", for example "toves"

It has problems with certain adverbs, for example "barely" or "curiously." 

Other suffixes also seem to present certain complications, for example "mastered." The issue is that sometimes the suffix creates an additional syllable, 
as in "blasted," but other times it doesn't.

It seems like resolving these problems might require using a phonemic representation of words. 

\begin{code}

syllableCount :: String -> Int
syllableCount aStr = syllableCountHelper (map toLower aStr)

syllableCountHelper :: String -> Int
syllableCountHelper "" = 0
syllableCountHelper [x]
    | isLetter x = 1
    | otherwise = 0
syllableCountHelper (x : y : "")
    | not (isLetter y) = syllableCountHelper (x : "")
    | (x `elem` ['h','l'])  && (y == 'e') = 1
    | (isConsonant x) && (y == 'e') = 0
    | (x == 'e') && (y == 's') = 0
    | (isVowel x) && (isConsonant y) = 1
    | (isVowel y) = 1
    | (y == 'y') = 1
    | otherwise = 0
syllableCountHelper (x : y : z : "")
    | not (isLetter z) = syllableCountHelper (x : y : "")
    | (x == 'l') && (y == 'e') && (z == 's') = 1
    | (x == 'i') && (y == 'e') && (z == 's') = 1
    | (x == 'e') && (y == 'l') && (z == 'y') = 1
    | (isVowel x) && (isConsonant y) = 1 + syllableCountHelper(y : z : "")
    | otherwise = syllableCountHelper (y : z : "")
syllableCountHelper (x : y : z: s)
    | not (isLetter z) = syllableCountHelper(x : y : "") + syllableCountHelper(s)
    | not (isLetter y) = syllableCountHelper(x : "") + syllableCountHelper(z : s)
    | not (isLetter x) = syllableCountHelper(y : z : s)
    | (isVowel x) && (isConsonant y) = 1 + syllableCountHelper (y : z : s)
    | (y == 'y') && (isConsonant z) = 1 + syllableCountHelper (y : z : s)
    | otherwise = syllableCountHelper (y : z : s)
    
\end{code}

IN WHICH WE TEST THINGS

\begin{code}

main :: IO ()
main = syllableTests

syllableTests :: IO ()
syllableTests = do
    putStrLn "Welcome to FP Haskell Center!"
    putStrLn (show (syllableCount "Welcome to FP Haskell Center!"))
    putStrLn "Have a good day!"
    putStrLn (show (syllableCount "Have a good day!"))
    putStrLn "A kind in glass and a cousin, a spectacle and nothing strange a single hurt color and an arrangement in a system to pointing. All this and not ordinary, not unordered in not resembling. The difference is spreading."
    putStrLn (show (syllableCount "A kind in glass and a cousin, a spectacle and nothing strange a single hurt color and an arrangement in a system to pointing. All this and not ordinary, not unordered in not resembling. The difference is spreading."))
    putStrLn "a"
    putStrLn (show (syllableCount "a"))
    putStrLn "syllable"
    putStrLn (show (syllableCount "syllable"))
    putStrLn "these are some words!"
    putStrLn (show (syllableCount "these are some words!"))
    putStrLn "stumble, these words"
    putStrLn (show (syllableCount "stumble, these words"))
    putStrLn "Stinged"
    putStrLn (show (syllableCount "stinged"))
    putStrLn "Sniffers"
    putStrLn (show (syllableCount "sniffers"))
    putStrLn "Slats"
    putStrLn (show (syllableCount "slats"))
    putStrLn "Kyryzstan"
    putStrLn (show (syllableCount "kyrgyzstan"))
    putStrLn "when to the sessions of sweet silent thought"
    putStrLn (show (syllableCount "when to the sessions of sweet silent thought"))
    putStrLn "I summon up remembrance of things past,"
    putStrLn (show (syllableCount "I summon up remembrance of things past,"))
    putStrLn "I sigh the lack of many a thing I sought,"
    putStrLn (show (syllableCount "I sigh the lack of many a thing I sought,"))
    print (map toLower "I sigh the lack of many a thing I sought,")
    putStrLn "And with old woes new wail my dear time\'s waste:"
    putStrLn (show (syllableCount "And with old woes new wail my dear time\'s waste:"))
    putStrLn "\n"
    putStrLn "And now, the monad speaks"
\end{code}
