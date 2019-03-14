module Life exposing (..)

type alias Cell = { x : Int, y : Int }

type CellStatus = Dead | Alive

type alias Board = Cell -> CellStatus

-- calculates the next status of a cell, given the number
-- of living neighbors and the cell's current status.
nextStatus : Int -> CellStatus -> CellStatus
nextStatus numberOfLivingNeighbors currentStatus =
    if currentStatus == Alive && numberOfLivingNeighbors > 3
        then Dead
        else if currentStatus == Alive && numberOfLivingNeighbors < 2
            then Dead
            else if currentStatus == Dead && numberOfLivingNeighbors == 3
                then Alive
                else currentStatus

-- calculates the number of living neighbors of a cell,
-- given a board of a cell.
livingNeighbors : Board -> Cell -> Int
livingNeighbors currentBoard cell = 
    let 
        neighbors : List Cell 
        neighbors = [ { x = cell.x, y = cell.y + 1 } ,
                      { x = cell.x + 1, y = cell.y + 1 } ,
                      { x = cell.x + 1, y = cell.y } ,
                      { x = cell.x + 1, y = cell.y - 1 } ,
                      { x = cell.x, y = cell.y - 1 } ,
                      { x = cell.x - 1, y = cell.y - 1 } ,
                      { x = cell.x - 1, y = cell.y } ,
                      { x = cell.x - 1, y = cell.y + 1 } ]
        
        listOfStatus : List CellStatus
        listOfStatus = List.map (currentBoard) (neighbors)

        listOfNumbers : List Int
        listOfNumbers = List.map (countStatus) (listOfStatus)

        countStatus : CellStatus -> Int
        countStatus (s) =
            case s of
                Alive -> 1
                Dead -> 0

        numberOfLivingNeighbors : Int
        numberOfLivingNeighbors =
            List.sum listOfNumbers
        in
        numberOfLivingNeighbors        

-- calculates the next board given the current board
nextBoard : Board -> Board
nextBoard currentBoard = 
    let
        newBoard : Cell -> CellStatus
        newBoard cell =
            let
                currentNeighbors = livingNeighbors currentBoard cell
                currentStatus = currentBoard cell
            in
            nextStatus currentNeighbors currentStatus
    in
    newBoard



-- RULES --

-- A cell is either dead or living
-- A living cell with fewer than 2 living neighbors becomes dead
-- A living cell with more than 3 living neighbors becomes dead
-- A dead cell with exactly 3 living neighbors becomes living

-- The board will be a square grid, and each square is one cell with 8 neighbors
-- For each "tick" that passes by, we'll re-compute which cells will be living
-- in the next tick, as well as which cells will die.