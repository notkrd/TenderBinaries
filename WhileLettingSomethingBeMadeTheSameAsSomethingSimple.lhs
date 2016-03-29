"Singing the way they did, in the old time, we can sometimes see through the tissues
and tracings the genetic process has laid down between us and them. The tendrils can
suggest a hand; or a specific color — the yellow of the tulip, for instance — will 
flash for a moment in such a way that after it has been withdrawn we can be sure that 
there was no imagining, no auto-suggestion here, but at the same time it becomes as 
useless as all subtracted memories. It has brought certainty without heat or light. 
Yet still in the old time, in the faraway summer evenings, they must have had a word 
for this, or known that we would someday need one, and wished to help."

-John Ashberry,  "Wherever it is, Wherever You Are"


\begin{code}
module WhileLettingSomethingBeMadeTheSameAsSomethingSimple where

import SomeAreGoingAboutBeingUnits
import System.Random
\end{code}


\begin{code}

jabber_dict :: [String]
jabber_dict = ["twas","brillig","and","the","slithy","toves","did","gyre","and","gimble","in","the","wabes","all","mimsy","were","the","borogroves","and","the","mome","raths","outgrabe"]

jabber_dict_just :: [StringUnit]
jabber_dict_just = map justWord jabber_dict

jabber_adj_dict :: [LabeledWord]
jabber_adj_dict = map (\wrd -> LabeledWord wrd "A") ["brillig","slithy","mimsy","mome"]

jabber_noun_dict :: [LabeledWord]
jabber_noun_dict = map (\wrd -> LabeledWord wrd "N") ["toves","wabes","borogroves","raths"]

jabber_verb_dict :: [LabeledWord]
jabber_verb_dict = map (\wrd -> LabeledWord wrd "V") ["gyre","gymbal","were","outgrabe"]

jabber_misc_dict :: [LabeledWord]
jabber_misc_dict = map (\wrd -> LabeledWord wrd wrd) ["twas", "and", "the", "did", "in", "all", "were"]

jabber_dict_labeled :: [LabeledWord]
jabber_dict_labeled = jabber_adj_dict ++ jabber_noun_dict ++ jabber_verb_dict ++ jabber_misc_dict

\end{code}
