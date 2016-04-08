"1
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
exist; poems, days, death"

-Inger Christensen, from \emph{Alphabet} trans. by Susanna Nied

\begin{code}

module SomeAreGoingAboutBeingUnits where

import Data.List

\end{code}

One tries to start with some kind of atoms, or pick those pieces and then
begin, knotting and knitting together the sorts of organized emptiness
that you have decided to make your poetry of. Mathematicians choose the
empty set, and walls of parenthesis; this binary builds nand-gates to dam
and release flows of \'1\'s that are really currents sliced into \'0\'s
that are really not; the inventors of our language \'a\' through \'z,\'
and its precursors, perhaps the dot and varying angles of line shoved and
burnt into clay or wax.

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

One kind of word is a word. By "word" here we mean a simply-linked list
of unicode characters, as explained in The Prelude.

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

And why just two?! Why not lists of twos of words:

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

In the end though we will write on something called trees - wrongly, as they
are at best stick-figures of trees: bark stripped, forked and bent. The point
of them though, here, is the ease of naming the whole of them and their
pieces simultaneously, tree, forest, bark, trunk, and branch all at once.

At the ends of one are words, which programmers and graph theorists ambitiously
and maybe also pathetically call leaves, and after those, the named forking
shapes of them. Unlike trees, a WordTree is constructed by attaching a plaque
to a bunch of little WordTrees glued together (each a noun or a verb phrase, or
a semicolon or a new metaphor for despair) at a WordNode. For us, a leaf is a
tree.

\begin{code}

data WordTree = WordLeaf {leaf_word :: String, what_kinds :: [String]}
  | WordNode {branches :: [WordTree], what_labels :: [String]}
    deriving (Eq, Ord, Show)

labelTree :: WordTree -> [String]
labelTree (WordLeaf _ its_kinds) = its_kinds
labelTree (WordNode _ its_labels) = its_labels

potentiallyBranches :: WordTree -> [WordTree]
potentiallyBranches (WordLeaf the_word the_names) = [WordLeaf the_word the_names]
potentiallyBranches (WordNode the_branches _) = the_branches

writeTree :: WordTree -> String
writeTree (WordLeaf some_leafy_word _) = some_leafy_word
writeTree (WordNode some_wordy_branches _) =
  concat (map writeTree some_wordy_branches)

instance PoemUnit WordTree where
  writeIt = writeTree
  justWord = (\some_word -> WordLeaf some_word ["Word"])
  cellar_door = WordLeaf "cellar door" ["CellarDoor"]
  

flattenTree :: WordTree -> WordTree
flattenTree (WordLeaf a_word words_for_it) = (WordLeaf a_word words_for_it)
flattenTree (WordNode all_branches overall_labels) =
  (WordNode (concat (map (potentiallyBranches . flattenTree) all_branches))
  (foldr (\some_branch some_labels -> union ((labelTree . flattenTree) some_branch) some_labels)
   overall_labels
   (map flattenTree all_branches)))
  
\end{code}

We ought to look at one or two, under some controversial microscope.

\begin{code}

unit_tests :: IO()
unit_tests = do
  putStrLn (writeIt ((justWord :: String -> StringUnit) "cellar-door"))
  putStrLn (writeIt ((justWord :: String -> LabeledWord) "cellar-door"))
  putStrLn (writeIt ((justWord :: String -> LabeledPhrase) "cellar-door"))
  putStrLn (writeIt ((justWord :: String -> WordTree) "cellar-door"))
  putStrLn (writeIt (cellar_door :: StringUnit))
  putStrLn (writeIt (cellar_door :: LabeledWord))
  putStrLn (writeIt (cellar_door :: LabeledPhrase))
  putStrLn (writeIt (cellar_door :: WordTree))
  
\end{code}
