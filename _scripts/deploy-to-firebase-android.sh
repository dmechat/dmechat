git log -1 --pretty="%s:%b" > release-notes.txt
flutter build apk
firebase appdistribution:distribute ../build/app/outputs/flutter-apk/app.apk --app 1:663814795413:android:863bc0eab194b31e24eb9c  --release-notes-file release-notes.txt --groups "testers" --token "$(<./firebase-token)" --debug