#!/bin/bash

fvm flutter build web --profile --dart-define=Dart2jsOptimization=O0
echo ----------
echo build complete
firebase deploy --only hosting
echo ----------
echo hosting deploy complete