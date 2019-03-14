module Lib.Memoize exposing (MemoizeStrategy, memoize)

import Dict


-- A strategy for turning a function into data structure
type alias MemoizeStrategy k x y =
  { toKey : x -> k
  , fromKey : k -> x
  , domain : List k
  , default : y
  }


-- Converts a function into a data structure, and outputs a new function
-- that uses that data structure instead of the old function. (This is
-- useful for optimizing program performance).
memoize : MemoizeStrategy comparable x y -> (x -> y) -> (x -> y)
memoize { toKey, fromKey, domain, default } fn =
  let
    memoized xs f = Dict.fromList (List.map (\x -> (x, f x)) xs)
    unMemoize y d x = Maybe.withDefault y (Dict.get x d)
    memo = memoized domain (fn << fromKey)
  in
  unMemoize default memo << toKey
