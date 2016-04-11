"What do you mean by \emph{rashes of ash}? Is industry
systematic work, assiduous activity, or ownership
of factories? Is \emph{ripple} agitate lightly? Are
we \emph{tossed} in tune when we write poems? And
what or who \emph{emboss with gloss insignias of air}?"

-Charles Bernstein, from "A Test of Poetry"

\begin{code}

module SomeAreBeingFlies where

import SomeAreGoingAboutBeingUnits
import WhileLettingSomethingBeMadeTheSameAsSomethingSimple
import Data.Array.IArray

\end{code}

Here, we learn to work with the Mysterious Force of Poetic Insight.

\begin{code}

import System.Random

\end{code}


\begin{code}

randomBranch :: WordTree -> StdGen -> (WordTree, StdGen)
randomBranch (WordLeaf a_word its_kinds) g = ((WordLeaf a_word its_kinds), g)
randomBranch (WordNode [] some_kinds) g = ((WordNode [] some_kinds), g)
randomBranch (WordNode some_branches some_kinds) g =
  let (which_fork, new_gen) = randomR (0, ((length some_branches) - 1)) g in
  ((some_branches !! which_fork), new_gen)

randomLeaf :: WordTree -> StdGen -> (WordTree, StdGen)
randomLeaf (WordLeaf a_word its_kinds) g = ((WordLeaf a_word its_kinds), g)
randomLeaf (WordNode [] kinds_of_nothing) g = ((WordLeaf [] kinds_of_nothing), g)
randomLeaf (WordNode some_branches some_kinds) g =
  randomBranch (flattenTree (WordNode some_branches some_kinds)) g
  
randomSection :: TreeDict -> StdGen -> (TreeDict, StdGen)
randomSection (DictEntry a_word its_kinds) g = ((DictEntry a_word its_kinds), g)
randomSection (DictSection some_sections some_kinds) g =
  let (which_fork, new_gen) = randomR (bounds some_sections) g in
  ((some_sections ! which_fork), new_gen)

randomEntry :: TreeDict -> StdGen -> (TreeDict, StdGen)
randomEntry (DictEntry an_entry its_kinds) g = ((DictEntry an_entry its_kinds), g)
randomEntry (DictSection some_sections some_kinds) g
  | elems some_sections == [] =
    ((treeToDict (WordNode [] some_kinds)), g)
  | otherwise = randomSection (flattenDict (DictSection some_sections some_kinds)) g

\end{code}
