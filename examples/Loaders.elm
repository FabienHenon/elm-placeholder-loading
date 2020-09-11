module Loaders exposing (main)

import Browser
import Html exposing (Html, div, h1, text)
import Html.Attributes as HtmlAttr
import PlaceholderLoading as Loading
import PlaceholderLoading.BulletList as BulletListLoader
import PlaceholderLoading.Code as CodeLoader
import PlaceholderLoading.Facebook as FacebookLoader
import PlaceholderLoading.Instagram as InstagramLoader
import PlaceholderLoading.List as ListLoader
import Svg
import Svg.Attributes as SvgAttr


type Msg
    = NoOp


type alias Model =
    ()


main : Program () Model Msg
main =
    Browser.document
        { init = always init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( (), Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "Bottom Scroll Example"
    , body =
        [ div []
            [ h1 [] [ text "Facebook loader" ]
            , FacebookLoader.view (Loading.config |> Loading.uniqueKey "facebook")
            ]
        , div []
            [ h1 [] [ text "Instagram loader" ]
            , InstagramLoader.view (Loading.config |> Loading.uniqueKey "instagram")
            ]
        , div []
            [ h1 [] [ text "Bullet list loader" ]
            , BulletListLoader.view (Loading.config |> Loading.uniqueKey "bullet-list")
            ]
        , div []
            [ h1 [] [ text "Code loader" ]
            , CodeLoader.view (Loading.config |> Loading.uniqueKey "code")
            ]
        , div []
            [ h1 [] [ text "List loader" ]
            , ListLoader.view (Loading.config |> Loading.uniqueKey "list")
            ]
        , div []
            [ h1 [] [ text "Custom loader" ]
            , Loading.customView
                (Loading.config
                    |> Loading.uniqueKey "custom"
                    |> Loading.addAttributes [ SvgAttr.viewBox ("0 0 " ++ String.fromInt (colsCount * cellWidth + (colsCount - 1) * xSpacing) ++ " " ++ String.fromInt (rowsCount * cellHeight + (rowsCount - 1) * ySpacing)) ]
                )
                (List.range 0 (rowsCount - 1)
                    |> List.concatMap
                        (\row ->
                            List.range 0 (colsCount - 1)
                                |> List.map
                                    (\col ->
                                        Svg.rect
                                            [ SvgAttr.x (String.fromInt (col * (cellWidth + xSpacing)))
                                            , SvgAttr.y (String.fromInt (row * (cellHeight + ySpacing)))
                                            , SvgAttr.width (String.fromInt cellWidth)
                                            , SvgAttr.height (String.fromInt cellHeight)
                                            , SvgAttr.rx "1"
                                            ]
                                            []
                                    )
                        )
                )
            ]
        , div []
            [ h1 [] [ text "Repeated list loader" ]
            , ListLoader.view
                (Loading.config
                    |> Loading.uniqueKey "list-repeated"
                    |> Loading.repeat 3
                    |> Loading.loaderAttributes [ HtmlAttr.style "margin-bottom" "1rem" ]
                )
            ]
        , div []
            [ h1 [] [ text "Custom config" ]
            , FacebookLoader.view
                (Loading.config
                    |> Loading.uniqueKey "facebook-custom"
                    |> Loading.backgroundColor "#00f"
                    |> Loading.backgroundOpacity 0.5
                    |> Loading.foregroundColor "#f00"
                    |> Loading.foregroundOpacity 0.5
                    |> Loading.gradientRatio 0.5
                    |> Loading.interval 0.1
                    |> Loading.rtl True
                    |> Loading.speed 3
                    |> Loading.title "Custom animation"
                )
            ]
        ]
    }


cellWidth : Int
cellWidth =
    90


cellHeight : Int
cellHeight =
    12


xSpacing : Int
xSpacing =
    10


ySpacing : Int
ySpacing =
    5


rowsCount : Int
rowsCount =
    5


colsCount : Int
colsCount =
    3


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
