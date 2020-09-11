module PlaceholderLoading.Facebook exposing (view)

{-| Display a Facebook loader

![Facebook loader](https://github.com/calions-app/elm-placeholder-loading/blob/master/facebook-loader.png)


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
            |> PlaceholderLoading.addAttributes [ SvgAttr.viewBox "0 0 476 124" ]
        )
        [ Svg.rect [ SvgAttr.x "48", SvgAttr.y "8", SvgAttr.width "88", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "48", SvgAttr.y "26", SvgAttr.width "52", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "56", SvgAttr.width "410", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "72", SvgAttr.width "380", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.rect [ SvgAttr.x "0", SvgAttr.y "88", SvgAttr.width "178", SvgAttr.height "6", SvgAttr.rx "3" ] []
        , Svg.circle [ SvgAttr.cx "20", SvgAttr.cy "20", SvgAttr.r "20" ] []
        ]
