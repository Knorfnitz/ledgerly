//
//  Categories.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

struct Category: Identifiable, Equatable, Hashable {
    typealias ID = UUID

    let id: ID
    var name: String
    var icon: String?

    init(
        id: ID = UUID(),
        name: String,
        icon: String? = nil
    ) {
        self.id = id
        self.name = name
        self.icon = icon
    }
}
