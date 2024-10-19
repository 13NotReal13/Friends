//
//  ContentView.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]

    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Inactive")
                                .foregroundColor(user.isActive ? .green : .red)
                        }

                        Spacer()

                        Text("\(user.age) years old")
                    }
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                Button("Load Data") {
                    loadData()
                }
            }
            .overlay {
                if isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }

    func loadData() {
        guard users.isEmpty else { return }
        isLoading = true

        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                isLoading = false
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedUsers = try decoder.decode([User].self, from: data)

                // Сохранение загруженных данных в SwiftData
                DispatchQueue.main.async {
                    for user in decodedUsers {
                        modelContext.insert(user)
                    }
                    isLoading = false
                }
            } catch {
                print("Failed to decode data: \(error.localizedDescription)")
                isLoading = false
            }
        }.resume()
    }
}
