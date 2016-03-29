1
apricot trees exist, apricot trees exist

2
bracken exists; and blackberries, blackberries;
bromine exists; and hydrogen, hydrogen

3
cicadas exist; chicory, chromium,
citrus trees; cicadas exist;
cicadas, cedars, cypresses, the cerebellum

4
doves exist, dreamers, and dolls;
killers exist, and doves, and doves;
haze, dioxin, and days; days
exist, days and death; and poems
exist; poems, days, death

-Inger Christensen, \emph{Alphabet}

\begin{code}

module SomeAreGoingAboutBeingUnits where

\end{code}

One tries to start with some kind of atoms, or pick those pieces and then
begin, knotting and knitting together the sorts of organized emptiness
that you have decided to make your poetry of. Mathematicians choose the
empty set, and walls of parenthesis; this binary builds nand-gates to dam
and release flows of \'1\'s sliced into \'0\'s; the inventors of our
language \'a\' through \'z,\' and its precursors, perhaps the dot and
varying angles of line shoved and burnt into clay or wax.

And there is speech in them we believe. Particularly, it is the possible
language in these etchings, the ability of their yielding material to
contain (point to, animate, imitate) specific speech, that makes them
this poem's first pieces. 

\begin{code}

class (Eq a, Ord a) => PoemUnit a where
  writeIt :: a -> String
  justWord :: String -> a
  cellar_door :: a

\end{code}



\begin{code}

newtype StringUnit = StringUnit { spat_letters :: String }
  deriving (Eq, Ord, Show)

unitNoMore :: StringUnit -> String
unitNoMore (StringUnit spat_letters) = spat_letters

instance PoemUnit StringUnit where
  writeIt = unitNoMore
  justWord = (\str -> StringUnit str)
  cellar_door = StringUnit "cellar-door"

\end{code}

The next representation of a word we will consider is again a word - but  where
we attach another word to it, labeling. Now twice as many words for your literary
pleasure, at the same low low price! A label could be a part of speech, a synonym,
or really any string at all - the text of Anna Karenina, or of the 1987
Philadelphia phone book. I wrote this thinking about parts speech though, and
generalizations thereof.

\begin{code}

data LabeledWord = LabeledWord {the_word :: String, the_label :: String} deriving (Eq, Ord, Show)
    
giveAWordANewLabel :: LabeledWord -> String -> LabeledWord
giveAWordANewLabel (LabeledWord some_word _) new_label = LabeledWord some_word new_label

instance PoemUnit LabeledWord where
    writeIt = (\lbl_wrd -> the_word lbl_wrd)
    justWord = (\str -> LabeledWord str "")
    cellar_door = LabeledWord "cellar-door" "cellar-door"

\end{code}

\begin{code}

newtype LabeledPhrase = LabeledPhrase {the_phrase :: [LabeledWord]} deriving (Eq, Ord, Show)

writePhrase :: LabeledPhrase -> String
writePhrase (LabeledPhrase the_phrase) =
  concat (map writeIt the_phrase)

instance PoemUnit LabeledPhrase where
  writeIt = writePhrase
  justWord = (\some_word -> LabeledPhrase [justWord some_word])
  cellar_door = LabeledPhrase [(cellar_door :: LabeledWord)]

\end{code}

\begin{code}

data WordTree = WordLeaf {leaf_word :: String, what_kinds :: [String]}
  | WordNode {branches :: [WordTree], what_kind :: [String]}
    deriving (Eq, Ord, Show)

writeTree :: WordTree -> String
writeTree (WordLeaf some_leafy_word _) = some_leafy_word
writeTree (WordNode some_wordy_branches _) =
  concat (map writeTree some_wordy_branches)

instance PoemUnit WordTree where
  writeIt = writeTree
  justWord = (\some_word -> WordLeaf some_word ["SomeWord"])
  cellar_door = WordLeaf "cellar door" ["CellarDoor"]

\end{code}

\begin{code}

main :: IO()
main = do
  putStrLn (writeIt (StringUnit "nope"))

\end{code}
