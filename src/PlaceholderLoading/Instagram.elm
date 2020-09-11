module PlaceholderLoading.Instagram exposing (view)

{-| Display an Instagram loader

![Instagram loader](https://github.com/calions-app/elm-placeholder-loading/blob/master/instagram-loader.png)


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
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 400 460" ]
        )
        [ Svg.circle [ SvgAttr.cx "31", SvgAttr.cy "31", SvgAttr.r "15" ] []
        , Svg.rect [ SvgAttr.x "58", SvgAttr.y "18", SvgAttr.width "140", SvgAttr.height "10", SvgAttr.rx "2", SvgAttr.ry "2" ] []
        , Svg.rect [ SvgAttr.x "58", SvgAttr.y "34", SvgAttr.width "140", SvgAttr.height "10", SvgAttr.rx "2", SvgAttr.ry "2" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "60", SvgAttr.width "400", SvgAttr.height "400", SvgAttr.rx "2", SvgAttr.ry "2" ] []
        ]
