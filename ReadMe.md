# PublicRepoes

#Overview

The PublicRepos App is an iOS application developed using SwiftUI and the MVVM (Model-View-ViewModel) architecture. It provides users with public GitHub repositories. The app allows users to view repo details, and see repo owner.

# App Structure

* App structure I use **MVVM**

* I used the **Repository** design pattern to act as a Data source from API.

* Use `DataLoader.swift` to get data from local JSON in test target.

* I used [SwiftLint](https://github.com/realm/SwiftLint) to enhance Swift style.

* Uses modern Swift features including async/await for network calls that come from the backend

* Use Environments and config Files to manage debug and release, read this [Environments and Config files](https://open.substack.com/pub/mariamelenna/p/how-to-set-up-your-app-for-develop?r=4eatr4&utm_campaign=post&utm_medium=web) to know more about it

* Dependency Injection, inject services to viewModel to able to test it and create mockService
and isolte network calls from viewmodel to make it in the ScreenService, viewmodel just need to fetch data it dosen't need to know from where

* Cashing images to save number of network calls


# UnitTest
* I apply  **Arrange, Act and Assert (AAA) Pattern** [AAA](https://medium.com/@pjbgf/title-testing-code-ocd-and-the-aaa-pattern-df453975ab80) in Unit Testing.

* I use mocking to Test get data from  NetworkManager, I use the same JSON file to mock data.

* Test get data From Local JSON.

* Code coverage +70%

#Please Read code comments

## Info

Name: Mariam Elenna
Email: mariam.khaled.elenna@gmail.com
