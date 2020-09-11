module PlaceholderLoading exposing
    ( Config
    , addAttributes
    , animate
    , attributes
    , backgroundColor
    , backgroundOpacity
    , baseUrl
    , config
    , customView
    , foregroundColor
    , foregroundOpacity
    , gradientRatio
    , interval
    , loaderAttributes
    , mainAttributes
    , repeat
    , rtl
    , speed
    , title
    , uniqueKey
    )

import Html
import Internals.Config as Config
import Svg
import Svg.Attributes as SvgAttr


type Config msg
    = Config (Config.Config msg)


config : Config msg
config =
    Config
        { animate = True
        , attributes = []
        , backgroundColor = "#f5f6f7"
        , backgroundOpacity = 1
        , baseUrl = ""
        , foregroundColor = "#eee"
        , foregroundOpacity = 1
        , gradientRatio = 2
        , interval = 0.25
        , loaderAttributes = []
        , mainAttributes = []
        , repeat = 1
        , rtl = False
        , speed = 1.2
        , title = Nothing
        , uniqueKey = "placeholder-loading-unique-key"
        }


animate : Bool -> Config msg -> Config msg
animate v (Config config_) =
    Config { config_ | animate = v }


backgroundColor : String -> Config msg -> Config msg
backgroundColor v (Config config_) =
    Config { config_ | backgroundColor = v }


backgroundOpacity : Float -> Config msg -> Config msg
backgroundOpacity v (Config config_) =
    Config { config_ | backgroundOpacity = v }


baseUrl : String -> Config msg -> Config msg
baseUrl v (Config config_) =
    Config { config_ | baseUrl = v }


foregroundColor : String -> Config msg -> Config msg
foregroundColor v (Config config_) =
    Config { config_ | foregroundColor = v }


foregroundOpacity : Float -> Config msg -> Config msg
foregroundOpacity v (Config config_) =
    Config { config_ | foregroundOpacity = v }


gradientRatio : Float -> Config msg -> Config msg
gradientRatio v (Config config_) =
    Config { config_ | gradientRatio = v }


interval : Float -> Config msg -> Config msg
interval v (Config config_) =
    Config { config_ | interval = v }


repeat : Int -> Config msg -> Config msg
repeat v (Config config_) =
    Config { config_ | repeat = v }


rtl : Bool -> Config msg -> Config msg
rtl v (Config config_) =
    Config { config_ | rtl = v }


speed : Float -> Config msg -> Config msg
speed v (Config config_) =
    Config { config_ | speed = v }


attributes : List (Svg.Attribute msg) -> Config msg -> Config msg
attributes v (Config config_) =
    Config { config_ | attributes = v }


addAttributes : List (Svg.Attribute msg) -> Config msg -> Config msg
addAttributes v (Config config_) =
    Config { config_ | attributes = config_.attributes ++ v }


title : String -> Config msg -> Config msg
title v (Config config_) =
    Config { config_ | title = Just v }


uniqueKey : String -> Config msg -> Config msg
uniqueKey v (Config config_) =
    Config { config_ | uniqueKey = v }


mainAttributes : List (Html.Attribute msg) -> Config msg -> Config msg
mainAttributes v (Config config_) =
    Config { config_ | mainAttributes = v }


loaderAttributes : List (Html.Attribute msg) -> Config msg -> Config msg
loaderAttributes v (Config config_) =
    Config { config_ | loaderAttributes = v }


customView : Config msg -> List (Svg.Svg msg) -> Html.Html msg
customView (Config config_) content =
    let
        fixedId =
            config_.uniqueKey

        idClip =
            fixedId ++ "-diff"

        idGradient =
            fixedId ++ "-animated-diff"

        keyTimes =
            "0; " ++ String.fromFloat config_.interval ++ "; 1"

        dur =
            String.fromFloat config_.speed ++ "s"

        rtlStyle =
            if config_.rtl then
                "; transform: scaleX(-1) translateX(-100%)"

            else
                ""
    in
    Html.div config_.mainAttributes
        (List.range 0 (config_.repeat - 1)
            |> List.map
                (\r ->
                    Html.div config_.loaderAttributes
                        [ Svg.svg config_.attributes
                            ((case config_.title of
                                Just title_ ->
                                    Svg.title [] [ Svg.text title_ ]

                                Nothing ->
                                    Svg.text ""
                             )
                                :: [ Svg.rect
                                        [ SvgAttr.x "0"
                                        , SvgAttr.y "0"
                                        , SvgAttr.width "100%"
                                        , SvgAttr.height "100%"
                                        , SvgAttr.clipPath ("url(" ++ config_.baseUrl ++ "#" ++ idClip ++ ")")
                                        , SvgAttr.style ("fill: url(" ++ config_.baseUrl ++ "#" ++ idGradient ++ ")" ++ rtlStyle)
                                        ]
                                        []
                                   , Svg.defs []
                                        [ Svg.clipPath [ SvgAttr.id idClip ] content
                                        , Svg.linearGradient [ SvgAttr.id idGradient ]
                                            [ Svg.stop
                                                [ SvgAttr.offset "0%"
                                                , SvgAttr.stopColor config_.backgroundColor
                                                , SvgAttr.stopOpacity (String.fromFloat config_.backgroundOpacity)
                                                ]
                                                [ if config_.animate then
                                                    Svg.animate
                                                        [ SvgAttr.attributeName "offset"
                                                        , SvgAttr.values (String.fromFloat (config_.gradientRatio * -1) ++ "; " ++ String.fromFloat (config_.gradientRatio * -1) ++ "; 1")
                                                        , SvgAttr.keyTimes keyTimes
                                                        , SvgAttr.dur dur
                                                        , SvgAttr.repeatCount "indefinite"
                                                        ]
                                                        []

                                                  else
                                                    Svg.text ""
                                                ]
                                            , Svg.stop
                                                [ SvgAttr.offset "50%"
                                                , SvgAttr.stopColor config_.foregroundColor
                                                , SvgAttr.stopOpacity (String.fromFloat config_.foregroundOpacity)
                                                ]
                                                [ if config_.animate then
                                                    Svg.animate
                                                        [ SvgAttr.attributeName "offset"
                                                        , SvgAttr.values (String.fromFloat (config_.gradientRatio * -1 / 2) ++ "; " ++ String.fromFloat (config_.gradientRatio * -1 / 2) ++ "; " ++ String.fromFloat (config_.gradientRatio / 2 + 1))
                                                        , SvgAttr.keyTimes keyTimes
                                                        , SvgAttr.dur dur
                                                        , SvgAttr.repeatCount "indefinite"
                                                        ]
                                                        []

                                                  else
                                                    Svg.text ""
                                                ]
                                            , Svg.stop
                                                [ SvgAttr.offset "100%"
                                                , SvgAttr.stopColor config_.backgroundColor
                                                , SvgAttr.stopOpacity (String.fromFloat config_.backgroundOpacity)
                                                ]
                                                [ if config_.animate then
                                                    Svg.animate
                                                        [ SvgAttr.attributeName "offset"
                                                        , SvgAttr.values ("0; 0; " ++ String.fromFloat (1 + config_.gradientRatio))
                                                        , SvgAttr.keyTimes keyTimes
                                                        , SvgAttr.dur dur
                                                        , SvgAttr.repeatCount "indefinite"
                                                        ]
                                                        []

                                                  else
                                                    Svg.text ""
                                                ]
                                            ]
                                        ]
                                   ]
                            )
                        ]
                )
        )
