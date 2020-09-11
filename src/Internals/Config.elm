module Internals.Config exposing (Config)

import Html
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
    , loaderAttributes : List (Html.Attribute msg)
    , mainAttributes : List (Html.Attribute msg)
    , repeat : Int
    , rtl : Bool
    , speed : Float
    , title : Maybe String
    , uniqueKey : String
    }
