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
could sit down, beginning to make stories. That, with or without the
sitting some mouth blows.

\begin{code}

newtype AlgPoet = AlgPoet {their_shtick :: InAWorld WordTree ->
                           InAWorld WordTree}
\end{code}

I'd like to write now, for a bit, without explaining anything else. i
want to write, and leave the draft here, because that's - the feel of
making language in the mouth, the motion of the graphite over a page or
of the pressure on my fingertips and the appearance of figures in the
monochramatic space rectangled in my screen - the story here. Maybe the
characters will fail to be people - missing hands or lungs - and maybe
the phrases or metaphors will point to nothing other than to themselves,
other than their failure to cause some new and subtler motion. But i
hope - need the hope, even as i might have learned to argue against it
as most silly and discredited by Derrida - that you can hear some breath.

That perhaps we start with a glass, that I do not know yet what to call
its material, but nonetheless this glass holds water and this water is
also a hole, hard until touched. That the language leads into that hole,
while respecting its lack of color - the language, like water, a substance
indicated and revealed by the way it refracts and redirects the outside
light, and by the occasional glimmer or bubble of its surface and
interior.

Holding this metaphor like liquid cupped for seconds in my palm, where
are we sitting?


\begin{code}

dictLessSyllablesThan :: Int -> TreeDict -> Bool
dictLessSyllablesThan n (WordLeaf some_wrd _) = (syllableCount some_wrd) <= n
dictLessSyllablesThan _ (WordNode _ _) = False

getWordShorterThan :: Int -> InAWorld WordTree -> String
getWordShorterThan n some_pm
  | n <= 0 = ""
  | dict_has (dictLessSyllablesThan n) (lexicon some_pm) =
    ""
  | otherwise = ""

onlySyllableCounter :: Int -> InAWorld WordTree -> InAWorld WordTree
  
\end{code}

I think i crave language aware of - still warm with - the hot spittle
of its own making. It seems possible - true, to me - that when a story
shouts "look, these character's are not people, are lists i jotted down
in a notebook with a name written above; my ideas are a prose style" the
continuing felt presence of the story, the fact that i hope that that
hollow and word-skinned character survives their author, is in fact
exactly what i want to be reminded of: not a fragile aesthetically
enforced hypnosis but a reminder that, despite all skepticism and
shouting, language remains. That we chat about actors while in the psych
ward. That we all still have the weather. "... we shall find there,
inside that seed, nothing but his featureless cell, nothing but voice,
nothing but darkness and talk." And in this way, maybe it is a relief,
an encouragement, that this language isn't just mine, and, when the
machine chops lists up and reassembles, it can, perhaps stop even being
just ours.
