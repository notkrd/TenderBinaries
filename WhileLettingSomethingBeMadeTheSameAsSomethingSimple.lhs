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
import Array
\end{code}

This page is intended as a sort of certification board for dictionaries. As the
National Institute of Standards and Technology offers fully measured and certified
peanut butter, here we give you some industrial quality, fully tested, nouns. But,
the NIST's peanut butter is \$835.00 a jar, and our nouns are provided free for the
public good. 

\begin{code}

jabber_dict :: [String]
jabber_dict = ["twas","brillig","and","the","slithy","toves","did","gyre","and","gimble","in","the","wabes","all","mimsy","were","the","borogroves","and","the","mome","raths","outgrabe"]

jabber_dict_just :: [StringUnit]
jabber_dict_just = map justWord jabber_dict

jabber_adj_dict :: [WordTree]
jabber_adj_dict = map (\wrd -> WordLeaf wrd ["A","Word"]) ["brillig","slithy","mimsy","mome"]

jabber_noun_dict :: [WordTree]
jabber_noun_dict = map (\wrd -> WordLeaf wrd ["N","Word"]) ["toves","wabes","borogroves","raths"]

jabber_verb_dict :: [WordTree]
jabber_verb_dict = map (\wrd -> WordLeaf wrd ["V","Word"]) ["gyre","gymbal","were","outgrabe"]

jabber_misc_dict :: [WordTree]
jabber_misc_dict = map (\wrd -> WordLeaf wrd [wrd,"Word"]) ["twas", "and", "the", "did", "in", "all", "were"]

jabber_dict_labeled :: [WordTree]
jabber_dict_labeled = concat [jabber_adj_dict, jabber_noun_dict, jabber_verb_dict, jabber_misc_dict]

jabber_tree = WordNode jabber_dict_labeled ["Dict"]

\end{code}

Lists are made a word at a time. Arrays are made with all words at once. Arrays
are faster to extract pieces from than lists (but harder to change). Dictionaries,
once made, stay fixed for a year or two, and we can leave their changing to certain
slow experts. 

\begin{code}

data TreeDict = DictEntry {simply_word :: String, what_kinds :: [String]}
  | DictSection {parts :: TreeDict, what_labels :: [String]}

treeToDict :: WordTree -> TreeDict
treeToDict WordLeaf its_word its_kinds = DictEntry its_word its_kinds
treeToDict 

\end{code}
