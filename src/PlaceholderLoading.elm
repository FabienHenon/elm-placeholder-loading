module PlaceholderLoading exposing
    ( Config, config
    , addAttributes, animate, attributes, backgroundColor, backgroundOpacity, baseUrl, foregroundColor, foregroundOpacity, gradientRatio, interval, loaderAttributes, mainAttributes, repeat, rtl, speed, title, uniqueKey
    , customView
    )

{-| Placeholder loading allows you to display placeholder loaders like Facebook's cards loading.

In this module you will be able to set the configuration of your loader and to create custom loaders


# Config

@docs Config, config


# Customization

@docs addAttributes, animate, attributes, backgroundColor, backgroundOpacity, baseUrl, foregroundColor, foregroundOpacity, gradientRatio, interval, loaderAttributes, mainAttributes, repeat, rtl, speed, title, uniqueKey


# Custom loaders

@docs customView

-}

import Html
import Internals.Config as Config
import Svg
import Svg.Attributes as SvgAttr


{-| Config type used to define loader configuration
-}
type Config msg
    = Config (Config.Config msg)


{-| Function to call to set a default configuration that you can then customize

    FacebookLoader.view PlaceholderLoading.config

-}
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


{-| Wether or not the loader should animate. Default to `True`

    PlaceholderLoading.config |> PlaceholderLoading.animate True

-}
animate : Bool -> Config msg -> Config msg
animate v (Config config_) =
    Config { config_ | animate = v }


{-| Color used as background of animation. Default to `#f5f6f7`

    PlaceholderLoading.config |> PlaceholderLoading.backgroundColor "#f5f6f7"

-}
backgroundColor : String -> Config msg -> Config msg
backgroundColor v (Config config_) =
    Config { config_ | backgroundColor = v }


{-| Background opacity. Default to `1`

    PlaceholderLoading.config |> PlaceholderLoading.backgroundOpacity 1

-}
backgroundOpacity : Float -> Config msg -> Config msg
backgroundOpacity v (Config config_) =
    Config { config_ | backgroundOpacity = v }


{-| Required if you use `<base url="/" />` document `<head />`. Used in `clipPath` and `fill` style. Default to `""`

    PlaceholderLoading.config |> PlaceholderLoading.baseUrl ""

-}
baseUrl : String -> Config msg -> Config msg
baseUrl v (Config config_) =
    Config { config_ | baseUrl = v }


{-| Color used as foreground of animation. Default to `#eee`

    PlaceholderLoading.config |> PlaceholderLoading.foregroundColor "#eee"

-}
foregroundColor : String -> Config msg -> Config msg
foregroundColor v (Config config_) =
    Config { config_ | foregroundColor = v }


{-| Animation opacity. Default to `1`

    PlaceholderLoading.config |> PlaceholderLoading.foregroundOpacity 1

-}
foregroundOpacity : Float -> Config msg -> Config msg
foregroundOpacity v (Config config_) =
    Config { config_ | foregroundOpacity = v }


{-| Width of the animated gradient as a raction of the view box width. Default to `2`

    PlaceholderLoading.config |> PlaceholderLoading.gradientRatio 2

-}
gradientRatio : Float -> Config msg -> Config msg
gradientRatio v (Config config_) =
    Config { config_ | gradientRatio = v }


{-| Interval of time between runs of the animation, as a fraction of the animation speed. Default to `0.25`

    PlaceholderLoading.config |> PlaceholderLoading.interval 0.25

-}
interval : Float -> Config msg -> Config msg
interval v (Config config_) =
    Config { config_ | interval = v }


{-| The number of times the loader should be displayed. Default to `1`

    PlaceholderLoading.config |> PlaceholderLoading.repeat 1

-}
repeat : Int -> Config msg -> Config msg
repeat v (Config config_) =
    Config { config_ | repeat = v }


{-| Wether or not the loader should be displayed for right-to-left. Default to `False`

    PlaceholderLoading.config |> PlaceholderLoading.rtl False

-}
rtl : Bool -> Config msg -> Config msg
rtl v (Config config_) =
    Config { config_ | rtl = v }


{-| Animation speed in seconds. Default to `1.2`

    PlaceholderLoading.config |> PlaceholderLoading.speed 1.2

-}
speed : Float -> Config msg -> Config msg
speed v (Config config_) =
    Config { config_ | speed = v }


{-| SVG attributes to pass to the main `svg` element. Default to `[]`

    PlaceholderLoading.config |> PlaceholderLoading.attributes []

-}
attributes : List (Svg.Attribute msg) -> Config msg -> Config msg
attributes v (Config config_) =
    Config { config_ | attributes = v }


{-| Add attributes to the `svg` element, like a `viewBox` for custom loaders.

    PlaceholderLoading.config |> PlaceholderLoading.addAttributes [ viewBox "0 0 100 60" ]

-}
addAttributes : List (Svg.Attribute msg) -> Config msg -> Config msg
addAttributes v (Config config_) =
    Config { config_ | attributes = config_.attributes ++ v }


{-| Ued to describe what element it is. Default to `Nothing`

    PlaceholderLoading.config |> PlaceholderLoading.title "My title"

-}
title : String -> Config msg -> Config msg
title v (Config config_) =
    Config { config_ | title = Just v }


{-| Used to uniquely identify the loader. You must specify it if you display several loaders on the same page. Default to `placeholder-loading-unique-key`

    PlaceholderLoading.config |> PlaceholderLoading.uniqueKey "placeholder-loading-unique-key"

-}
uniqueKey : String -> Config msg -> Config msg
uniqueKey v (Config config_) =
    Config { config_ | uniqueKey = v }


{-| Set the HTML attributes of the main encapsulating `div`. Default to `[]`

    PlaceholderLoading.config |> PlaceholderLoading.mainAttributes []

-}
mainAttributes : List (Html.Attribute msg) -> Config msg -> Config msg
mainAttributes v (Config config_) =
    Config { config_ | mainAttributes = v }


{-| Set the HTML attributes of the `div` encapsulating the `svg` element. Default to `[]`

    PlaceholderLoading.config |> PlaceholderLoading.loaderAttributes []

-}
loaderAttributes : List (Html.Attribute msg) -> Config msg -> Config msg
loaderAttributes v (Config config_) =
    Config { config_ | loaderAttributes = v }


{-| Display a custom loader.

    PlaceholderLoading.customView
        (PlaceholderLoading.config
            |> PlaceholderLoading.uniqueKey "custom"
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 476 124" ]
        )
        [ Svg.rect [ SvgAttr.x "48", SvgAttr.y "8", SvgAttr.width "88", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "48", SvgAttr.y "26", SvgAttr.width "52", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "56", SvgAttr.width "410", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "72", SvgAttr.width "380", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "88", SvgAttr.width "178", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.circle [ SvgAttr.cx "20", SvgAttr.cy "20", SvgAttr.r "20" ] []
        ]

-}
customView : Config msg -> List (Svg.Svg msg) -> Html.Html msg
customView (Config config_) content =
    let
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
                    let
                        fixedId =
                            config_.uniqueKey ++ "-" ++ String.fromInt r

                        idClip =
                            fixedId ++ "-diff"

                        idGradient =
                            fixedId ++ "-animated-diff"
                    in
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
