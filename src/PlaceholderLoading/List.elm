module PlaceholderLoading.List exposing (view)

{-| Display a list loader

![List loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/list-loader.png)


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
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 400 110" ]
        )
        [ Svg.rect [ SvgAttr.x "0", SvgAttr.y "0", SvgAttr.width "250", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        , Svg.rect [ SvgAttr.x "20", SvgAttr.y "20", SvgAttr.width "220", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        , Svg.rect [ SvgAttr.x "20", SvgAttr.y "40", SvgAttr.width "170", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "60", SvgAttr.width "250", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        , Svg.rect [ SvgAttr.x "20", SvgAttr.y "80", SvgAttr.width "200", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        , Svg.rect [ SvgAttr.x "20", SvgAttr.y "100", SvgAttr.width "80", SvgAttr.height "10", SvgAttr.rx "3", SvgAttr.ry "3" ] []
        ]
