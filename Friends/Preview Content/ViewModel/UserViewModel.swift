//
//  UserViewModel.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import Foundation

final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func fetchUsers() {
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }
                } catch {
                    print("Failed to decode JSON: \(error.localizedDescription)")
                }
            }
        }
        .resume()
    }
}
