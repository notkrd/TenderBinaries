"For the listener, who listens in the snow, 
And, nothing himself, beholds 
Nothing that is not there and the nothing that is."

-Wallace Stevens

\begin{code}

module Main where

\end{code}

Tender Binaries: Water Plastic Writing

This project will demonstrate, by construction, the possibility of a complex poetics and writing practice that works in and around programming, and its algorithmically structured output. It will try to be a self-e­xplaining and self-justifying work – the code-text of the work will commentate on and explain the technical choices made, but also the aesthetic choices, under the premise that these technical choices are also aesthetic ones, and that some aesthetic and scholarly questions are related to formal languages and systems of abstract rules (or at least to the cultural, linguistic, economic or political significances of these technical systems). In the material and cultural context of a piece of software, the appropriate context for these explanations and arguments seems to be that of the program’s internal comments and documentation. These two kinds of writing are a central part of the current cultural practice of writing programs, and this project contextualizes itself against that practice. I will emphasize the first kind of commentary – the internal comments – in order to foreground and investigate the relationship between “natural” English text and formal, algorithmic, or technical text.

As a piece of writing, it will alternate a kind of lyric essay with collections of programmed patterns – in word choice, syntax, and similar sorts of combinatory rules. The finished work will generate short texts under a variety of constraints – to work in a manageable domain, it will probably produce when run poems of one, or at most a few, sentences, and not consider line breaks or narrative. A part of this project’s goal is to investigate the technologies it is produced within, so it’s worth saying a bit about them. Whether the generated texts will all explore some more specific and limited subject matters has yet to be determined. It will be written in the programming language Haskell (in the emacs environment, in a virtual linux environment, etc.) as that programming language is interested in allowing complex things to be written in a highly compressed way, which reveals their mathematical structure. Haskell is centered around something called a “monad” (unrelated to the theological term) that concords well with this project’s claim that the process of writing a poem can be seen as one of making a series of choices of transformations chosen from a not necessarily very large vocabulary. There is a movement in the American programming community, popularized by Donald Knuth, known as “literate programming” which emphasizes the integration of rich (LaTex) comments with the code; this being a literary arts class and all, we will be using Literate Haskell and the corresponding development tools. Another source of material will be actual poetry: the program’s modules will be epigraphed, and their names found in Jackson Mac Low’s The Pronouns - itself an example of algorithmically mediated writing. 

The goals and aesthetics of this thing will be quite personal; perhaps the more broadly significant point is that a personal – perhaps even banal, gimmicky, or self-absorbed – poetics, and not just a conceptual one, can successfully exist within this practice. The goal is not to produce “good” poetry this way: just to show that some kind of poetry can be written like this, and have it be mine to the same extent that my notebook scribblings are. This is not a new point with regard to chance-influenced writing in general, but does still seem like a close to open problem with commentated computer programs. The things this code-text would challenge include the sense of an ideal text as a singular, final, and closed document, and the belief that art is always a direct (as opposed to indirect, convoluted, chance-or-algorithm-mediated) result of aesthetic choices made by a human agent. It would put forward the claim that coding technologies and formalisms can be a good material for art-making, that the code-text can be structured, aesthetic, and interesting - rather than a collection of efficient probabilistic tools for extracting structure from a corpus of other texts - and also that these kinds of mediums can allow for art that says new things, or says some old things particularly well. At the same time it would reiterate, from the inside this time, that code-texts are already making aesthetic and cultural choices with social significance. 

In its current state, it can be found at: https://github.com/notkrd/TenderBinaries
and also: https://github.com/notkrd/LWordGrowths

As stated, this project has not yet developed the poetics proposed. 

\begin{code}

main :: IO()
main = do
  putStrLn "Poetry under construction, please come back later"

\end{code}
