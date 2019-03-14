module Lib.List exposing (filterMaybes, cross, zip)


-- Take a list of 'Maybe's as input and outputs the (potentially
-- shorter) list of 'Just' values, discarding any 'Nothing's.
filterMaybes : List (Maybe a) -> List a
filterMaybes = List.filterMap (\x -> x)


-- Takes two lists as input, and outputs the list of all ordered pairs.
--
-- For example:
--
--     cross [1, 2] ['a', 'b'] == [(1, 'a'), (2, 'a'), (1, 'b'), (2, 'b')]
cross : List a -> List b -> List (a, b)
cross xs ys = List.concatMap (\x -> List.concatMap (\y -> [(x, y)]) ys) xs


-- Takes two lists as input, and outputs the list of aligned ordered pairs.
--
-- For example:
--
--     zip [1, 2] ['a', 'b'] == [(1, 'a'), (2, 'b')]
zip : List a -> List b -> List (a, b)
zip left right =
  case (left, right) of
    (_, []) -> []
    ([], _) -> []
    (x :: xs, y :: ys) -> (x, y) :: zip xs ys
