# elm-placeholder-loading

Easily create placeholder loadings like Facebook's cards loading.

![Facebook loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/facebook-loader.png)

```
elm install calions-app/elm-placeholder-loading
```

**This package has been highly inspired from [danilowoz react-content-loader package](https://github.com/danilowoz/react-content-loader) and is mainly a translation of the react package to Elm.**

In this package you will be able to display placeholder loaders like Facebook's one. We have several presets:
* [Facebook](#preset-facebook)
* [Instagram](#preset-instagram)
* [Bullet list](#preset-bullet-list)
* [List](#preset-list)
* [Code](#preset-code)
* [And customized loaders](#preset-custom)

All you need is to call the `view` function, no state to save in your model!

## Getting started

You need to import the main module (`PlaceholderLoading`) and the preset you want:

```elm
import PlaceholderLoading as Loading
import PlaceholderLoading.Facebook as FacebookLoader
```

Then, simply call the `view` function of your preset and you're done!

```elm
FacebookLoader.view Loading.config
```

**If you need to display several loaders in the same page you'll have to provide a unique key to your loaders, like this:**

```elm
FacebookLoader.view (Loading.config |> Loading.uniqueKey "facebook-loader")
```

## Customization

You can customize you loaders by changing the configuration of the loader when you cann the `view` function:

```elm
FacebookLoader.view 
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
    )
```

This will display the Facebook's loader with different colors and animation speed and in Right To Left display

### Repeated loaders

You can also repeat the loaders the number of times you want by simply add the configuration `repeat`:

```elm
ListLoader.view
    (Loading.config
        |> Loading.uniqueKey "list-repeated"
        |> Loading.repeat 3
        |> Loading.loaderAttributes [ HtmlAttr.style "margin-bottom" "1rem" ]
    )
```

![Repeated list loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/repeated-list-loader.png)

This will display the list loader 3 times. This way you can simulate a longer content to come

<a id="preset-custom"></a>
## Custom loader

You can also create your own loaders. All you need is to provide the SVG code of your loader:

```elm
loader : Svg.Svg msg
loader =
    let
        cellWidth =
            90

        cellHeight =
            12

        xSpacing =
            10

        ySpacing =
            5

        rowsCount =
            5

        colsCount =
            3
    in
    Loading.customView
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
```

This will show the following loader:

![Custom loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/custom-loader.png)

## Presets

<a id="preset-facebook"></a>
### Facebook

![Facebook loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/facebook-loader.png)

<a id="preset-instagram"></a>
### Instagram

![Instagram loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/instagram-loader.png)

<a id="preset-bullet-list"></a>
### Bullet list

![Bullet list loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/bullet-list-loader.png)

<a id="preset-list"></a>
### List

![List loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/list-loader.png)

<a id="preset-code"></a>
### Code

![Code loader](https://raw.githubusercontent.com/calions-app/elm-placeholder-loading/master/code-loader.png)

## Examples

Go to the `examples` folder and run:

```
elm reactor
```

to run examples


