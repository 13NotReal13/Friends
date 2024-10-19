//
//  User.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import Foundation
import SwiftData

@Model
class User: Codable, Identifiable {
    var id: UUID
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var friends: [Friend]
    var isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, age, company, email, address, friends, isActive
    }

    init(id: UUID, name: String, age: Int, company: String, email: String, address: String, friends: [Friend], isActive: Bool) {
        self.id = id
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.friends = friends
        self.isActive = isActive
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
        address = try container.decode(String.self, forKey: .address)
        friends = try container.decode([Friend].self, forKey: .friends)
        isActive = try container.decode(Bool.self, forKey: .isActive)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(friends, forKey: .friends)
        try container.encode(isActive, forKey: .isActive)
    }
}
