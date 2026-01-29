//
//  Categories.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

public struct Category: Identifiable, Equatable, Hashable {
    public typealias ID = UUID

    public let id: ID
    public var name: String
    public var icon: String?

    public init(
        id: ID = UUID(),
        name: String,
        icon: String? = nil
    ) {
        self.id = id
        self.name = name
        self.icon = icon
    }
}
