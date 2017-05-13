# DeviceWallpaper

[DeviceWallpaper - App Store](https://itunes.apple.com/jp/app/devicewallpaper/id1226955020?mt=8)

This application can output your device information as wallpaper.  
If you have a lot of test devices, it is useful to display the device name and OS number on the wallpaper.

![Screen\.gif \(346×620\)](https://raw.githubusercontent.com/starhoshi/DeviceWallpaper/master/Screen.gif)

## VIPER Architecture

* Module
    * View
    * Interactor
    * Presenter
    * Entity
    * Router
    * ~~DataManager~~

This application does not using DataManager.  
I think DataManager is over-engineering.

### Reference

* [Architecting iOS Apps with VIPER · objc\.io](https://www.objc.io/issues/13-architecture/viper/)
* [iOS Project Architecture: Using VIPER \| Cheesecake Labs](https://cheesecakelabs.com/blog/ios-project-architecture-using-viper/)
* [pedrohperalta/Articles\-iOS\-VIPER: Demo app for VIPER design pattern implementation](https://github.com/pedrohperalta/Articles-iOS-VIPER)

## Tests (Spec)

Implementation and spec files exist same directory.

