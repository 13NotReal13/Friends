//
//  UserDetailsView.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.blue)
                        .clipShape(Circle())
                    
                    Text(user.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(user.company)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("About Me")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Text(user.about)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Text("Age: \(user.age)")
                    
                    Text("Email: \(user.email)")
                    
                    Text("Address: \(user.address)")
                    Text("Registered on: \(formattedDate(user.registered))")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray6)))
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Friends")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(user.friends) { friend in
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.gray)
                                .clipShape(Circle())
                            
                            Text(friend.name)
                                .font(.body)
                                .fontWeight(.medium)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6)))
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Circle()
                            .fill(user.isActive ? Color.green : Color.red)
                            .frame(width: 12, height: 12)
                        Text(user.isActive ? "Online" : "Offline")
                            .fontWeight(.medium)
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    func formattedDate(_ isoDateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: isoDateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        } else {
            return "Unknown Date"
        }
    }
}

#Preview {
    let exampleFriend1 = Friend(id: UUID(), name: "John Doe")
    let exampleFriend2 = Friend(id: UUID(), name: "Jane Smith")
    let exampleUser = User(
        id: UUID(),
        name: "Alex Johnson",
        age: 29,
        company: "Tech Corp",
        email: "alex.johnson@techcorp.com",
        address: "123 Swift Street, Cupertino, CA",
        about: "iOS Developer with 5 years of experience in Swift and SwiftUI. Loves building apps and exploring new technologies.",
        registered: "2015-11-10T01:47:18-00:00",
        isActive: true,
        friends: [exampleFriend1, exampleFriend2]
    )
    
    UserDetailsView(user: exampleUser)
}
