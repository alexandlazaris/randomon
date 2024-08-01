# randomon
PokemonAPI in Flutter

## Resources

- https://pub.dev/packages/cached_network_image
- https://www.youtube.com/watch?v=yLtpMqvMgdY
- https://dart-tutorial.com/dart-how-to/generate-random-number-in-dart/
- https://pokeapi.co/docs/v2
- https://github.com/flutter/flutter/blob/master/.gitignore
- https://shorebird.dev/
- https://api.flutter.dev/flutter/material/Icons-class.html
- https://github.com/semantic-release/semantic-release/issues/2469
- https://stackoverflow.com/questions/47423297/how-can-i-add-a-border-to-a-widget-in-flutter
- https://api.dart.dev/stable/3.4.4/dart-math/Random-class.html
- https://stackoverflow.com/questions/66856094/cached-network-image-does-not-show-progress-indicator-when-image-is-loading
- https://stackoverflow.com/questions/71735947/flutter-how-to-delay-a-function-for-some-seconds
- https://www.flaticon.com/free-icon/pokeball_528101
- https://stackoverflow.com/questions/43928702/how-to-change-the-application-launcher-icon-on-flutter
- https://pub.dev/packages/flutter_launcher_icons
- https://docs.flutter.dev/cookbook/navigation/passing-data
- https://www.flutterclutter.dev/flutter/tutorials/2023-04-08-how-to-use-keys/
- https://medium.com/@lazy_mind/how-to-pass-a-data-between-screens-in-flutter-from-basic-to-advance-in-dart-9f69f0ee998e
- https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

## Resources

- closed pokeball icon - <a href="https://www.flaticon.com/free-icons/pokemon" title="pokemon icons">Pokemon icons created by Those Icons - Flaticon</a>
- retry icon - <a href="https://www.flaticon.com/free-icons/refresh" title="refresh icons">Refresh icons created by Freepik - Flaticon</a>
- open pokeball icon - <a href="https://www.flaticon.com/free-icons/pokeball" title="pokeball icons">Pokeball icons created by Shahzama Ahmad - Flaticon</a>
- hat - <a href="https://www.flaticon.com/free-icons/ash" title="ash icons">Ash icons created by Shahzama Ahmad - Flaticon</a>


## Issues

### No internet permission
In `./android/app/src/main/AndroidManifest.xml`
, add `<uses-permission android:name="android.permission.INTERNET"/>` to allow release builds to use internet on device.

flutter pub run flutter_launcher_icons