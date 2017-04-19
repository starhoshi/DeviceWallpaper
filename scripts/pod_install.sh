#!/bin/sh -x

bundle exec pod install && bundle exec carthage_acknowledgements generate -o=./DeviceWallpaper/Resources/Settings.bundle/Acknowledgements.plist -p=DeviceWallpaper

