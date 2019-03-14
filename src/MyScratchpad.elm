module MyScratchpad exposing (..)

myMessage : String
myMessage = "Hello, Welcome to my Hope World!"
--Happy Birthday Jung Hoseok<3
--BTS Fighting (^U^)
--f x = (2*x + 7) / -12
f : Float -> Float
f x = g -12 x

--absoluteValue 5 = 1 * 5
--absoluteValue -5 = -1 * -5
--absoluteValue x = 1 * x if x is positive
--absoluteValue x = -1 * x if x is negative
absoluteValue x =
    if (x > 0)
        then 1*x
        else if (x < 0)
            then -1*x
            else 0
simplifiedAbsoluteValue x =
    if (x > 0)
        then x
        else -1*x

g x y = (2*y + 7) / x

myList : List String
myList = ["Hello", "Wide", "World"]

iHaveNoWords :List String
iHaveNoWords = []

point : (Float, Float)
point = (1.41, -1.67)

origin3D : (Float, Float, Float)
origin3D = (0, 0, 0)

someStuffIShovedTogether : (String, Int, Float)
someStuffIShovedTogether = ("hey", -2, 3.0)
-- 2 tuple or 3 tuples are how you say ordered pairs

--noWay : List ???
-- noWay = ["mixed", 5, "list"] X
thisIsFine = ("mixed", 0, "tuple")

onlyOne : List number
onlyOne = [1]

oneAndTwo : List number
oneAndTwo = [1, 2]

oneToThree : List number
oneToThree = [1, 2, 3]

--[functions -In programming]
--  We define and manipulate values.
--  Every value has exactly one type.
--  Functions are mappings/relationships between types.
--  Every function has a type for it Input or Output.
--  If you have a function and a value whose type is 
--      the input type of the function, you can APPPLY
--      the function to the value and get back a value type
--      will be the functions output type.

--Bool = True or False
isVowel : Char -> Bool
isVowel c = 
    case c of
        'a' -> True
        'e' -> True
        'i' -> True
        'o' -> True
        'u' -> True
        _ -> False

numericBool : Bool -> Int
numericBool b =
    case b of
        True -> 1
        False -> 0

isEmpty : List Char -> Bool
isEmpty l =
    case l of
        [] -> True
        (head :: tail) -> False
-- (::) a way to construct a list
--  ('a' :: 'b')

--cleanerIsEmpty : List Char -> Bool
--cleanerIsEmpty l =
--    case l of
--        [] -> True
--        _ -> False

countVowels : String -> Int
countVowels s = 
    let
        stringAsList : List Char
        stringAsList = String.toList s

        listOfBools : List Bool
        listOfBools = List.map (isVowel) (stringAsList)
        
        listOfNumbers : List Int
        listOfNumbers = List.map (numericBool) (listOfBools)
        
        sumOfList : Int
        sumOfList = List.sum (listOfNumbers)
    in
    sumOfList

-- Plan:
--  1. convert our 'String' to a 'List Char'
--  2. use 'isVowel' on every 'Char' in our 'List Char' to
--     get a 'List Bool'
--  3. use 'numericBool' on every 'Bool' in our 'list Bool'
--      to get a 'List Int'
--  4. get the sum of the numbers in that list

sum : List number -> number
sum someList =
    case someList of
        [] -> 0
        (theHeadOfTheList :: theRestOfTheList) ->
            theHeadOfTheList + sum (theRestOfTheList)


type alias Point3D =
    { x : Float, y : Float, z : Float }

origin : Point3D
origin = { x = 0, y = 0, z = 0 }

goUp : Point3D -> Point3D
goUp pt = { x = pt.x, y = pt.y, z = pt.z + 1 }

type PaymentType = Cash | Credit | Check

type alias Payment = {
    name : String,
    amount : Float,
    paymentType : PaymentType
    }

processPayment : Payment -> String
processPayment { paymentType } =
    case paymentType of
        Cash -> "Thank you, have a great day!"
        Credit -> "Card number, please?"
        Check -> "lol, no"
