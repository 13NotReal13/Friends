//
//  FriendsApp.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import SwiftUI
import SwiftData

@main
struct FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
