"Singing the way they did, in the old time, we can sometimes see through the tissues
and tracings the genetic process has laid down between us and them. The tendrils can
suggest a hand; or a specific color — the yellow of the tulip, for instance — will 
flash for a moment in such a way that after it has been withdrawn we can be sure that 
there was no imagining, no auto-suggestion here, but at the same time it becomes as 
useless as all subtracted memories. It has brought certainty without heat or light. 
Yet still in the old time, in the faraway summer evenings, they must have had a word 
for this, or known that we would someday need one, and wished to help."

-John Ashberry, from  "Wherever it is, Wherever You Are"


\begin{code}
module WhileLettingSomethingBeMadeTheSameAsSomethingSimple where

import SomeAreGoingAboutBeingUnits
import Data.Array.IArray
\end{code}

This page is intended as a sort of certification board for dictionaries. As the
National Institute of Standards and Technology offers fully measured and certified
peanut butter, here we give you some industrial quality, fully tested, nouns. But,
the NIST's peanut butter is \$835.00 a jar, and our nouns are provided free, for the
public good.

\begin{code}

data TreeDict = DictEntry {simply_word :: String, what_kinds :: [String]}
  | DictSection {parts :: Array Int TreeDict, what_labels :: [String]}
    deriving (Eq, Ord, Show)

\end{code}

Lists are made a word at a time. Arrays are made with all words at once. Arrays
are faster to extract pieces from than lists (but harder to change). Dictionaries,
once made, stay unedited for a year or two, and we can leave their modification to
certain slow experts. As such, they are easily flipped through, by index or by
cut out finger ellows, with embossed lettering, in search of your word. You've got
to first know how to start spelling it though.

\begin{code}

treeToDict :: WordTree -> TreeDict
treeToDict (WordLeaf its_word its_kinds) =
  DictEntry its_word its_kinds
treeToDict (WordNode the_word_trees labels) =
  DictSection (listArray (0, ((length the_word_trees) - 1))
               (map treeToDict the_word_trees)) labels

dictToTree :: TreeDict -> WordTree
dictToTree (DictEntry its_word its_kinds) = WordLeaf its_word its_kinds
dictToTree (DictSection its_parts its_labels) =
  WordNode (map dictToTree (elems its_parts)) its_labels

instance PoemUnit TreeDict where
  writeIt = writeIt . dictToTree
  justWord = treeToDict . justWord
  cellar_door = treeToDict cellar_door

empty_dict :: TreeDict
empty_dict = treeToDict empty_tree

dict_has :: (TreeDict -> Bool) -> TreeDict -> Bool
dict_has the_test (DictEntry a_word its_kinds) =
  the_test (DictEntry a_word its_kinds)
dict_has the_test (DictSection sub_sections its_kinds) =
  the_test (DictSection sub_sections its_kinds) ||
  (foldr (\a_dict a_bool -> (the_test a_dict) || a_bool) False (elems sub_sections))

flattenDict :: TreeDict -> TreeDict
flattenDict = treeToDict . flattenTree . dictToTree

(||+||) :: TreeDict -> TreeDict -> TreeDict
(||+||) first_dict second_dict
  | first_dict == empty_dict = second_dict
  | second_dict == empty_dict = first_dict
  | otherwise = treeToDict ((dictToTree first_dict)
              /\+/\ (dictToTree second_dict))

concatDicts :: [TreeDict] -> TreeDict
concatDicts = treeToDict . concatTrees . (map dictToTree)

jabber_dict = treeToDict jabber_tree

\end{code}

We'll set our dictionary makers to their index card researches
in some dim but windowed room. 

\begin{code}

jabber_words :: [String]
jabber_words = ["twas","brillig","and","the","slithy","toves",
                "did","gyre","and","gimble","in","the","wabe",
                "all","mimsy","were","the","borogroves",
                "and","the","mome","raths","outgrabe"]

jabber_words_just :: [StringUnit]
jabber_words_just = map justWord jabber_words

jabber_adj_tree :: WordTree
jabber_adj_tree =
  (WordNode (map (\wrd -> WordLeaf wrd ["A","Word"])
             ["brillig","slithy","mimsy","mome"])
   ["A","Dict","Jabberwocky"])

jabber_noun_tree :: WordTree
jabber_noun_tree =
  (WordNode (map (\wrd -> WordLeaf wrd ["N","Word"])
             ["toves","wabe","borogroves","raths"])
   ["N","Dict","Jabberwocky"])

jabber_verb_tree :: WordTree
jabber_verb_tree =
  (WordNode (map (\wrd -> WordLeaf wrd ["V","Word"])
            ["gyre","gymbal","were","outgrabe"])
   ["V","Dict","Jabberwocky"])

jabber_misc_tree :: WordTree
jabber_misc_tree =
  (WordNode (map (\wrd -> WordLeaf wrd [wrd,"Word"])
            ["twas", "and", "the", "did", "in", "all", "were"])
   ["Closed-Cat","Dict","Jabberwocky"])

jabber_tree :: WordTree
jabber_tree =
  (WordNode [jabber_adj_tree, jabber_noun_tree, jabber_verb_tree, jabber_misc_tree]
   ["Dict","Jabberwocky"])

\end{code}

Some people say they like to read the dictionary, though the rest of us tend to
suspect that they're just trying (and ineffectively at that) to show off. 

\begin{code}

dict_tests :: IO()
dict_tests = do
  putStrLn (show jabber_words)
  putStrLn (concat jabber_words)
  putStrLn (show jabber_tree)
  putStrLn (writeIt jabber_tree)
  putStrLn (show jabber_dict)
  putStrLn (writeIt jabber_dict)
  putStrLn (show (flattenDict jabber_dict))
  putStrLn (writeIt (flattenDict jabber_dict))

\end{code}
