# randomon
PokemonAPI in Flutter

## Resources

- https://pub.dev/packages/cached_network_image
- https://www.youtube.com/watch?v=yLtpMqvMgdY
- https://dart-tutorial.com/dart-how-to/generate-random-number-in-dart/
- https://pokeapi.co/docs/v2
- https://github.com/flutter/flutter/blob/master/.gitignore
* https://shorebird.dev/


## Issues

### No internet permission
In `./android/app/src/main/AndroidManifest.xml`
, add `<uses-permission android:name="android.permission.INTERNET"/>` to allow release builds to use internet on device.