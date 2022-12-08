//
//  helloWorldApp.swift
//  helloWorld
//
//  Created by csy on 2022/12/2.
//

import SwiftUI

@main
struct helloWorldApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
