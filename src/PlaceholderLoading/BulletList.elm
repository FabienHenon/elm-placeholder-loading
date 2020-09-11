module PlaceholderLoading.BulletList exposing (view)

{-| Display a bullet list loader

![Bullet list loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/bullet-list-loader.png)


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
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 245 125" ]
        )
        [ Svg.circle [ SvgAttr.cx "10", SvgAttr.cy "20", SvgAttr.r "8" ] []
        , Svg.rect [ SvgAttr.x "25", SvgAttr.y "15", SvgAttr.width "220", SvgAttr.height "10", SvgAttr.rx "5", SvgAttr.ry "5" ] []
        , Svg.circle [ SvgAttr.cx "10", SvgAttr.cy "50", SvgAttr.r "8" ] []
        , Svg.rect [ SvgAttr.x "25", SvgAttr.y "45", SvgAttr.width "220", SvgAttr.height "10", SvgAttr.rx "5", SvgAttr.ry "5" ] []
        , Svg.circle [ SvgAttr.cx "10", SvgAttr.cy "80", SvgAttr.r "8" ] []
        , Svg.rect [ SvgAttr.x "25", SvgAttr.y "75", SvgAttr.width "220", SvgAttr.height "10", SvgAttr.rx "5", SvgAttr.ry "5" ] []
        , Svg.circle [ SvgAttr.cx "10", SvgAttr.cy "110", SvgAttr.r "8" ] []
        , Svg.rect [ SvgAttr.x "25", SvgAttr.y "105", SvgAttr.width "220", SvgAttr.height "10", SvgAttr.rx "5", SvgAttr.ry "5" ] []
        ]
