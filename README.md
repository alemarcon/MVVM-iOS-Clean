# MVVM Clean iOS starter project

![platform](https://img.shields.io/badge/platform-iOS-lightgrey) 
![swift](https://img.shields.io/badge/Swift-5.0-red)  
![target-ios](https://img.shields.io/badge/Target-iOS%20%7C%2012.1-blue)
![cocoapods-version](https://img.shields.io/badge/Cocoapods-v.%201.8.4-green)

This is a clean iOS project structured as follow:

- MVVM
- Clean architecture
- Repository pattern
- Cocoapods for dependency manager
- Full use of Dependency Injection
- Alamofire for easy and fast network request
- Combine for view model and view controller binding
- Localized, just 2 languages for demo porpouse
- Storyboard for interfaces
- Unit Test

You can use this project as a template to start building your new iOS app.

# What's inside.
This is a simple demo project that implement MVVM Clean architecture and repository pattern. It's a COVID-19 dashboard with a very simple (and fake) login view. It collect data from remote or local repository. The local repository, just to keep the app simple, stores the data in UserDefaults but, in a real project, if you need to save a large amount of data, it would be better to use a database like Realm, SQL Lite or Core Data. It include also a Unit test as sample to show how to integrate test on this architecture.

#### ATTENTION!
COVID-19 data is real and collected by https://covid19api.com/ but the application is not intended to be a medical tool. COVID-19 api are free and here are used just to show how to execute network request and parse them.

# What do you need to start

All you need to start with this project is

- Xcode 
- Cocoapods

If you don't have cocoapods on your mac, or you don't know what cocoapod is, check this out https://cocoapods.org/

# Let's start

1  
After cloning project from Github, open terminal and navigate in project folder

> cd /your_loca_path/MVVM-Clean

2  
next, install all pods with command.

> pod install

When all pods are installed, open project folder by digit on terminal

> open .

double click on **MVVM-Clean.xcworkspace** file and Xcode will be opened.

# External Library

These are the libraries used in project with github url and a very short description.

 LIBRERIA | URL | DESCRIZIONE
 -------- | --- | -----------
 Swinject | https://github.com/Swinject/Swinject | Dependency injection framework
 Alamofire | https://github.com/Alamofire/Alamofire | An easy-to-use HTTP networking library

 # External resource

Covid-19 data are collected by [COVID-19 API](https://covid19api.com/)

The users Icons is made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>