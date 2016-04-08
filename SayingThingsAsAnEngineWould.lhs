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
tragedy and loss, biology, "small talk") into questions about language and of
form in it.

\begin{code}

import Control.Monad
import Control.Monad.State.Lazy

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
poem as a series of transformations: a monad, one of the main features
of this programming language, gives a good framework for describing any
of the things you could do with some odd pieces of a poem, all lost and
left, and make new pieces, some approaching poetry. 

\begin{code}

data (Eq a, Ord a, Show a) => InAWorld a =
  InAWorld {poem :: WordTree, lexicon :: TreeDict,
            mysterious_insight :: StdGen, weather :: [String],
            is_complete :: Bool}
  deriving (Eq, Ord, Show)
  

\end{code}


There\’s a story, I think first Buddhist, where a group of blind people are
shown an elephant. The first one feels its head, and says “an elephant is
like a pot, it is round and rough.” The second one feels its ear and says
“it is like a winnowing basket” (whatever that is). Someone else feels its
tusk and explains that it’s like a plough, a fourth one holds the creature’s
trunk and claims it\'s a kind of snake, and another feels its tail and calls
the elephant a paintbrush.

Well a group of mathematicians are presented an elephant – and the
topologist examines its surface and concludes that the elephant is
essentially a donut with 7 or 8 holes. The group theorists kicks the animal
from various directions, does nothing, pulls at its trunk and watches the
elephant whine and kick, then describes the collection of things a person
can cause an elephant to do. The calculus students draws a bunch of
rectangles and decides that the elephant weighs around 2.734 tonnes and takes
up 9.72 cubic meters. The category theorist climbs onto its back and observes
that elephants can be used as modes of transportation, and that elephants are
really the same as a subcategory of the category of vehicles. The geometer
wonders what it would be like to live on the elephants hide, and gives
directions for the quickest way to get from its ear to its trunk. The set
theorist walks up to it and concludes there is an elephant, walks around and
concludes that there isn\'t elephant everywhere, then demonstrates that if
she could break it into a few hundred pieces, without stretching or changing
the pieces in any way she could put the pieces back together into two
elephants as big as the first one. You couldn\'t exactly say that between
them you have an elephant, but they have all these new views of the thing.
The method of math, as a way of understanding the world, is of selective
blindness, of ignoring everything about something except a few of its
formally described properties. And maybe it\'s better to just say, “elephant”
and stop there, but I think the groping blind people discover something I
would never have noticed otherwise – that a tail can work like a brush, and
that the elephant\'s trunk, if you look at it right, is just like a snake.
