//
//  Friend.swift
//  Friends
//
//  Created by Иван Семикин on 18/10/2024.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}
