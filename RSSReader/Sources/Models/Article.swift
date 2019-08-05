//
//  Article.swift
//  RSSReader
//
//  Created by Олег Крылов on 03/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import Foundation
struct Article: Decodable {
    let id: Int
    let title: String
    let content: String
    let imageURL: URL?
}
