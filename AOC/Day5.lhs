-----------
title: 'Day 5: Binary Boarding'
subtitle: 'Advent of Code 2020'
published: 'Wednesday 23 Dec 2020 05:31:10 GMT'
sort: 5
source_repo_url: 'https://github.com/t1lde/AOC2020'
source_in_repo_url: 'https://github.com/t1lde/AOC2020/tree/master/AOC/Day5.lhs'
-----------

> module Day5 where
> import Control.Arrow
> import Data.List

 <!--imports-->

Day 5: Binary Boarding
=====

Challenge1
----------

The first task is to process a bunch of binary-space partition indices,
and return the highest equivalent index in a square.

To find the highest index we can simply lexically sort, taking B > F, R > L

> data BSPIndex = L | R | F | B
>   deriving stock (Eq, Ord, Read, Show)

> toBit :: BSPIndex -> Int
> toBit B = 1
> toBit R = 1
> toBit _ = 0
>
> toId :: [BSPIndex] -> Int
> toId = foldl' (\acc x -> 2*acc + (toBit x)) 0

> run1 :: [String] -> Int
> run1 =
>   (fmap (mapMaybe (pure >>> readMaybe @(BSPIndex))))
>     >>> maximum
>     >>> toId

> run2 :: [String] -> Maybe Int
> run2 =
>   (fmap (mapMaybe (pure >>> readMaybe @(BSPIndex))))
>     >>> (fmap toId)
>     >>> sort
>     >>> (scanl (\(prev, _) x -> (x, x-prev)) (1,0) )
>     >>> (find (snd >>> (==2)))
>     >>> (fmap (fst >>> (subtract 1)))
