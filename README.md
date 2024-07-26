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

## Issues

### No internet permission
In `./android/app/src/main/AndroidManifest.xml`
, add `<uses-permission android:name="android.permission.INTERNET"/>` to allow release builds to use internet on device.