"fill, fill.
I heard words   
and words full

of holes   
aching. Speech   
is a mouth."

- Robert Creeley, from "The Language"

\begin{code}

module GoingAboutAndComingAcrossArt where

import SomeAreGoingAboutBeingUnits
import WhileLettingSomethingBeMadeTheSameAsSomethingSimple
import SomeAreBeingFlies
import SayingThingsAsAnEngineWould
import PuttingAStoryBetweenMuchRailing

import System.Random
import Control.Monad

\end{code}

That i - that someone - standing in the wreck and not the story of it
could sit, beginning to make stories. That, with or without the sitting,
some mouth blows.

\begin{code}

newtype AlgPoet = AlgPoet {their_shtick :: InAWorld WordTree ->
                           InAWorld WordTree}
\end{code}

I'd like to write now, for a bit, without explaining anything else. I
want to write, and leave the draft here, because that's - the feel of
making language in the mouth, the motion of the graphite over a page or
of the pressure on my fingertips and the appearance of figures in the
monochramatic space rectangled in my screen - the story here. Maybe the
characters will fail to be people - missing hands or lungs - and maybe
the phrases or metaphors will point to nothing other than to themselves,
other than their failure to cause some new and subtler motion. But i
hope - need the hope, even as i might argue against it as most silly
and disproved by the postructuralists - that you can hear some breath.

\begin{code}

onlySyllableCounter :: treeDict -> Int -> InAWorld WordTree -> InAWorld WordTree
onlySyllableCounter some_dict num_syllables some_poem =
  | num_syllables <= 0 = SomePm
  | dict_has (\an_entry -> (syllableCount (writeIt an_entry))
                           some_dict  <= num_syllables) =
    SomePm /\+/\ ((lift treeToDict) . grabALeaf some_dict)

  
\end{code}
