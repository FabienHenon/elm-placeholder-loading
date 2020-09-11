module PlaceholderLoading.Code exposing (view)

{-| Display a code loader

![Code loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/code-loader.png)


# View

@docs view

-}

import Html
import PlaceholderLoading as PlaceholderLoading
import Svg
import Svg.Attributes as SvgAttr


{-| Shows the loader with the specified configuration

        Loader.view PlaceholderLoader.config

-}
view : PlaceholderLoading.Config msg -> Html.Html msg
view config =
    PlaceholderLoading.customView
        (config
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 340 84" ]
        )
        [ Svg.rect [ SvgAttr.x "0", SvgAttr.y "0", SvgAttr.width "67", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "76", SvgAttr.y "0", SvgAttr.width "140", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "127", SvgAttr.y "48", SvgAttr.width "53", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "187", SvgAttr.y "48", SvgAttr.width "72", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "18", SvgAttr.y "48", SvgAttr.width "100", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "71", SvgAttr.width "37", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "18", SvgAttr.y "23", SvgAttr.width "140", SvgAttr.height "11", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "166", SvgAttr.y "23", SvgAttr.width "173", SvgAttr.height "11", SvgAttr.rx "3" ] []
        ]
