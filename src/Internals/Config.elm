module Internals.Config exposing (Config)

import Svg


type alias Config msg =
    { animate : Bool
    , attributes : List (Svg.Attribute msg)
    , backgroundColor : String
    , backgroundOpacity : Float
    , baseUrl : String
    , foregroundColor : String
    , foregroundOpacity : Float
    , gradientRatio : Float
    , interval : Float
    , rtl : Bool
    , speed : Float
    , title : Maybe String
    , uniqueKey : String
    }
