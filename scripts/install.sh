#!/bin/sh -x

bundle install --path vendor/bundle

brew update
brew install carthage
brew install imagemagick
brew install graphicsmagick
brew install direnv

open DeviceWallpaper.xcworkspace

