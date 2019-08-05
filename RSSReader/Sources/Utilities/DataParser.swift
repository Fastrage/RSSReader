//
//  DataParser.swift
//  RSSReader
//
//  Created by Олег Крылов on 03/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import Foundation

protocol iDataParser {
    func parseDataFromFile() -> [Article]
}
class DataParser: iDataParser {
    func parseDataFromFile() -> [Article] {
        let url = Bundle.main.url(forResource: "CachedArticles", withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let JSON = try! JSONDecoder().decode([Article].self, from: data)
        print(JSON)
        
        return JSON
    }
}
