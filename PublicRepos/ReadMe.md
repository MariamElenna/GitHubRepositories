#  Read Me
Overview
The PublicRepos App is an iOS application developed using SwiftUI and the MVVM (Model-View-ViewModel) architecture. It provides users with public GitHub repositories. The app allows users to view repo details, and see repo owner.

Features

View all repositories information(name, cration date, and owner name and image).

View detailed repo information, including name, cration date, and owner name and image.

Uses modern Swift features including async/await for network calls that come from the backend

Use Environments and config Files to manage debug and release
(https://open.substack.com/pub/mariamelenna/p/how-to-set-up-your-app-for-develop?r=4eatr4&utm_campaign=post&utm_medium=web)
you can read this to know more about it

Naming: 
View -> ScreenNameView
ViewModel -> SceenNameViewModel
Model -> ScreenNameModel
Service -> ScreenNameService


Dependency Injection, inject services to viewModel to able to test it and create mockService
and isolte network calls from viewmodel to make it in the ScreenService, viewmodel just need to fetch data it dosen't need to know from where

Cashing images to save number of network calls

Testing ViewModels

Testing Models
