# randomon
A speedrun of using Flutter and the PokemonAPI

## Features
- load pokemon from Gen I-IV
- randomized each load
- save to your party
- clear party

## Todo
- expand learning into keys, providers, builders, state 
management
- add automated testing for widgets and interactions
- tap individual pokemon to clear from list
- add in loading skeleton when fetching data
- maintain app data when closing/relaunching app
- publish on mobile app stores


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


## Known limitations

- logic to check caught pokemon is not 100%. Duplicate pokemmon can be caught
- other than gifs/images, all other network data is not cached

## Performance
- gifs/images are cached on device, enabling quicker rendering on subsequent loads

## No internet permission
In `./android/app/src/main/AndroidManifest.xml`
, add `<uses-permission android:name="android.permission.INTERNET"/>` to allow release builds to use internet on device.

## Produce app icons for platforms
1. edit values in `pubspec.yaml` underneath `flutter_launcher_icons` & save
2. run `flutter pub run flutter_launcher_icons`




