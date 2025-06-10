//
//  Category.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//

class Category: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let image: String
    let creationAt: String
    let updatedAt: String
}

//https://fakeapi.platzi.com/en/rest/categories/#get-all-products-by-category

/*

Migration from UI to Widgets
Mobx

Statemanagement -
Stateful and Stateless Widgets

Protocol

ViewdidLoad and ViewDidAppeare

Which method is right for API Calling

Debugger Mode / Application Debugging

App is launch - App State Changed - Method called during the App launch/state changes

If app you using App

Methodologies- Agile, Canban, Waterfall - Retrospect and Burndown Chart

Appstore submission process
    - APNS Certification
    - Dist Certificates
AppID and Bundel Identifier
GCD, Operation Queue - Diff When we have to use GCD vs Operation Queue

Sqlite Vs CoreData
NSUserDefault

Barear Token Expiration

Networkcalls

MVC and MVVM

Swift UI
Memory Leaks - Tool

SWIFTUI Lifecycle

Album

*/
