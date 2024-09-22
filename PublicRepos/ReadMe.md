#  Read Me
Overview
The PublicRepos App is an iOS application developed using SwiftUI and the MVVM (Model-View-ViewModel) architecture. It provides users with public GitHub repositories. The app allows users to view repo details, and see repo owner.

Features

View all repositories information().
View detailed weather information, including temperature, humidity, and wind speed.
Displays a historical log of weather data for added cities.
Handles network connectivity changes gracefully.
Uses modern Swift features including async/await for network calls that come from the backend using objective c 'Network Layer'


I am writing these notes to help you navigate the app, understand why I am doing specific things

1:
This app use Environments and config Files to manage debug and release
(https://open.substack.com/pub/mariamelenna/p/how-to-set-up-your-app-for-develop?r=4eatr4&utm_campaign=post&utm_medium=web)
you can read this to know more about it

2: 
App architechture pattern is MVVM(Model-View-ViewModel)
you can find screens in Scenes Folder with all related files

3:
Naming: 
View -> ScreenNameView
ViewModel -> SceenNameViewModel
Model -> ScreenNameModel
Service -> ScreenNameService


4- Dependency Injection 
we inject services to viewmodel to able to test it and create mockService
and we isolte network calls from viewmodel to make it in the ScreenService, viewmodel just need to fetch data it dosen't need to know from where

5- Cashing
we are cashing images to save number of network calls
