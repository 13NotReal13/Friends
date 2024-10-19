//
//  UserDetailsView.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import SwiftUI
import SwiftData

struct UserDetailsView: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.largeTitle)
                .bold()
            
            Text(user.company)
                .foregroundStyle(.secondary)

            Text(user.address)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Friends")
                .font(.title2)
                .padding(.top)

            List(user.friends) { friend in
                Text(friend.name)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
