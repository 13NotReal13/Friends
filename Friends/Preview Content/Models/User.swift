//
//  User.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let isActive: Bool
    let friends: [Friend]
}
