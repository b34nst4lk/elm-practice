import Debug exposing (log)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


-- # Core Language

-- ## Function definition

addOne x = x + 1
subtractOne x = x - 1
double x = x * 2 
half x = x / 2

-- ## Function 

-- # Elm Architecture

main = 
    Browser.sandbox {
        init = 1,
        update = update,
        view = view
    }

-- ## Model

type Msg  
    = Increment 
    | Decrement
    | Double
    | Half
    | DoubleAndAddOne
    
-- ## Update

update msg model = 
    case msg of 
        Increment ->
            addOne model
    
        Decrement ->
            subtractOne model

        Double ->
            double model

        Half ->
            half model

        DoubleAndAddOne ->
            double model
            |> addOne
            
-- ## View

view model = 
    div []
        [ div [] [text (String.fromFloat model)]
        , button [onClick Increment] [text "+"]
        , button [onClick Decrement] [text "-"]
        , button [onClick Double] [text "Double"]
        , button [onClick Half] [text "Half"]
        , button [onClick DoubleAndAddOne] [text "Double then +1"]
        ]