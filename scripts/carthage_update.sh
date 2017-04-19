#!/bin/sh -x

carthage update --platform iOS --no-use-binaries && bundle exec carthage_acknowledgements generate -o=./DeviceWallpaper/Resources/Settings.bundle/Acknowledgements.plist -p=DeviceWallpaper

