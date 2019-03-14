import Lib.Color as Color
import Lib.Graphics as Graphics
import Lib.Game as Game
import Lib.Memoize as Memoize
import Lib.List as List

import Debug exposing (todo)

import Life exposing (Board, Cell, CellStatus(..), nextBoard)


-- To define a program, we need
--   1. A type for the possible states         type State
--   2. A type for the possible events         type Event
--   3. A transition function                  update : event -> state -> state
--   4. An initial state                       init : state
--   5. A view function                        view : state -> Canvas event


type alias State = { board : Board }
type Event = NoOp


main : Game.Game State Event
main =
  Game.game
    { init = initialState
    , update = updateGame
    , view = drawGame
    }


-- This is the board our game will start with.
initialState : State
initialState =
  let
    startingBoard : Board
    startingBoard cell = todo "startingBoard"
  in
  { board = startingBoard }


-- This function uses the incoming event and the current game state to
-- decide what the next game state should be.
updateGame : Game.GameEvent Event -> State -> State
updateGame event currentState =
  case event of
    -- What to do when we get a `ClockTick`
    Game.ClockTick _ ->
      let
        updatedBoard = todo "updatedBoard"
      in
      { board = updatedBoard }

    -- What to do when we get a `NoOp`
    Game.Custom NoOp->
      currentState


-- Pick a size for the game board.
-- Hint: Use this when you go to write `drawCell` and `drawGame`
boardSize : Int
boardSize = todo "boardSize"


-- The list of all cells based on your `boardSize`.
allCells : List Cell
allCells =
  let
    range = List.range 0 boardSize
    toCell (x_coord, y_coord) = { x = x_coord - 1, y = y_coord - 1 }
  in
  List.map toCell (List.cross range range)


-- This function will use the game state to decide what to draw on the screen.
drawGame : State -> Graphics.Canvas Event
drawGame state =
  let
    drawCell : Cell -> Graphics.Svg a
    drawCell cell =
      let
        cellStatus : CellStatus
        cellStatus = todo "cellStatus"

        cellColor : Color.Color
        cellColor = 
          case cellStatus of
            Alive -> todo "cellColor"
            Dead -> todo "cellColor"

      in
      Graphics.drawRect
        { x0 = todo "x0"
        , y0 = todo "y0"
        , width = todo "width"
        , height = todo "height"
        , fill = todo "fill"
        , onClick = Nothing
        }

    cells : List (Graphics.Svg a)
    cells = List.map drawCell allCells

  in
  Graphics.canvas (todo "canvas inputs")
    {
      title = todo "title",
      widthPx = todo "widthPx",
      heightPx = todo "heightPx",
      xMax = todo "xMax",
      yMax = todo "yMax",
      children = cells
    }