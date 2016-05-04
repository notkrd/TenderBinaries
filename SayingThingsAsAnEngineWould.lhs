"The figured wheel rolls through shopping malls and prisons
Over farms, small and immense, and the rotten little downtowns.
Covered with symbols, it mills everything alive and grinds
The remains of the dead in the cemeteries, in unmarked graves and oceans."

- Robert Pinsky, from "The Figured Wheel"

\begin{code}

module SayingThingsAsAnEngineWould where

import SomeAreGoingAboutBeingUnits
import WhileLettingSomethingBeMadeTheSameAsSomethingSimple
import SomeAreBeingFlies

import System.Random
import Data.Set (Set)
import qualified Data.Set as Set

\end{code}

I do not want to overstate the accuracy or usefulness of the generalized
abstractions i am proposing. Though i like decent writing and the better
math, they remain obviously, fundamentally, and inevitably different things:
a beautiful proof is shit poetry, and a perfectly precise poem is
irrelevent mathematics. However, the thing i find myself thinking about -
thinking again about, returning to thinking  about in different names and
from new standing places - is some idea or question about structure and form:
the role of it, its' basic shapes, the odd bass pull of it.

In poetics, this for me becomes a question about the relationships between
precise and careful patterns and orthogonal components of something like
randomness in literary writing. In math, in addition to the general
preoccupation of the subject with identifying and classifying structure
(google the phrase "up to canonical isomorphism") i wonder about the kinds
of narrative structure, choices of notation, and rhetorical devices that
reveal a mathematical text as clear or elegant or beautiful.

One of the things art does, maybe the main one, is to interrogate structure:
to transform questions and anxieties about various kinds of patterned and
rule-constrained or shared experience (law, ritual, care, the repetitions of
tragedy and loss, biology, small talk) into questions about language and of
form in it. Because i do think we are caught in form and directed by it;
that "form" is a good word with which to begin describing the thing that we
are caught in.


\begin{code}

import Data.Functor
import Control.Monad

\end{code}

A monad is an odd specific wondrous technical thing. It does not paraphrase
well. As the good Wikipedia tells it:

"If $C$ is a category, a  monad on $C$ consists of an endofunctor
$T \colon C \to C$ together with two natural transformations:

$\eta \colon 1_{C} \to T$ (where $1_{C}$ denotes the identity functor on $C$)
and $\mu \colon T^{2} \to T$ (where $T^{2}$ is the functor $T \circ T$ from
$C$ to $C$).

These are required to fulfill the following conditions (sometimes called
coherence conditions):
$\mu \circ T\mu = \mu \circ \mu T$ (as natural transformations $T^{3} \to T$); 
$\mu \circ T \eta = \mu \circ \eta T = 1_{T}$

(as natural transformations $T \to T$; here $1_{T}$ denotes the identity
transformation from $T$ to $T$)."

As the fine, if at times a bit uptight, Haskell documentation would have
it "Monads can be viewed as a standard programming interface to various
data or control structures, which is captured by the Monad class."

Paraphrase fails it, is at times i think, less accurate than silence or
nonsense. But here the monad will let us represent, as we intend to, a
poem as a series of transformations: What it will do is gather together
the bits of information, outside of the poem, that will direct its
composition. A monad, one of the main features of this programming
language, gives a good framework for describing any of the things you
could do with some odd pieces of a poem, all lost and left, and make
new pieces, some approaching poetry.

\begin{code}

data InAWorld a =
  InAWorld {lexicon :: TreeDict, mysterious_insight :: StdGen,
            weather :: Set String,
            notes :: [String], is_complete :: Bool,
            the_thing :: a}
  
theWorldRemains :: (a -> b) -> InAWorld a -> InAWorld b
theWorldRemains f thing_in_world =
  thing_in_world {the_thing = f (the_thing thing_in_world)}

instance Functor InAWorld where
  fmap = theWorldRemains

\end{code}

What contexts to place some object into? A choice of dictionary, first
facts, a Mysterious Force of Poetic Insight, the standard situations
to direct its growths around?

\begin{code}

global_dict :: TreeDict
global_dict = jabber_dict

first_surprise :: StdGen
first_surprise = mkStdGen 1729

\end{code}

Intending to or not, even intending not to, i find myself taking on this
explaining voice: as though I were some kind of professor or new lecturing
acquaintance at a party. This register presupposes that the code is some
collection of totally clear and precise ideas, and the rest of it just an
explanation of those ideas. Then, it's 'literary' in so far as the
explanations are codes constructed out of occasionaly imagistic metaphors -
but the goal of the language is, still, to produce explanations that
precisely parallel the mathematical and algorithmic goings on, yet are more
readily parsed and digested by a reader's English-speaking mind.

I would like some other kind of explanation, that doesn't actualy describe
the explained object but still, somehow, sketches its landscape. Sometimes,
this is what i imagine fiction or poetry doing: somehow, at the end of the
story, you find yourself left, after reading this accumulation of irrelevant
noun-phrases and unreal events, with the sense of some way of looking or
pattern of meaning-making through which to look at, to speak of some
as-yet unspoken pieces of, this world here.

\begin{code}

takeOutside :: a -> InAWorld a
takeOutside a =
  InAWorld global_dict
   first_surprise Set.empty
   [] False
   a

poemBind :: InAWorld a -> (a -> InAWorld b) -> InAWorld b
poemBind thing_in_world funcIntoWorld =
  let ((InAWorld a_lex
          an_insight a_weather
          some_notes a_completion
          a_thing),
       (InAWorld b_lex
       b_insight b_weather
       b_notes b_completion
       b_thing)) =
        (thing_in_world, (funcIntoWorld a_thing)) in
  (InAWorld a_lex
   b_insight (Set.union a_weather b_weather)
   (some_notes ++ b_notes) False
   b_thing)

instance Monad InAWorld where
  (>>=) = poemBind
  return = takeOutside
  
\end{code}

Imagine 3 or 4 people - let's go with 4 - in a room. The walls are
almost-white, almost-yellow, and on parallel sides pictured and postered
over. One of them is sitting on the bed in the far corner, her feet
rolled under her. It is not that she is sitting this way now, or that he
is necessarily leaning with raised teacup against the closet wall, or
even that they sit uniquely in the chair under the window, folder and
pencil out, but that when you think about the 4 of you, you find
yourselves in that 2/3 underground room with her tucked into the corner
and under her laptop. Where is this room now, where do you sit?

\begin{code}

actRandomly :: (a -> StdGen -> (b, StdGen)) -> InAWorld a -> InAWorld b
actRandomly theActs thing_in_world =
  thing_in_world {the_thing = (fst (theActs (the_thing thing_in_world)
                                   (mysterious_insight thing_in_world))),
                 mysterious_insight = (snd (theActs (the_thing thing_in_world)
                                           (mysterious_insight thing_in_world)))}

grabABranch :: InAWorld WordTree -> InAWorld WordTree
grabABranch = actRandomly randomBranch

grabALeaf :: InAWorld WordTree -> InAWorld WordTree
grabALeaf = actRandomly randomLeaf

openASection :: InAWorld TreeDict -> InAWorld TreeDict
openASection = actRandomly randomSection

openAnEntry :: InAWorld TreeDict -> InAWorld TreeDict
openAnEntry = actRandomly randomEntry

\end{code}
