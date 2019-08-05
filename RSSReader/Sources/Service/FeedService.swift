//
//  FeedService.swift
//  RSSReader
//
//  Created by Олег Крылов on 03/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import Foundation
protocol iFeedService {
    func getArticles() -> [Article]
}
class FeedService : iFeedService{
    private var dataParser: iDataParser
    init() {
        dataParser = DataParser()
    }
    func getArticles() -> [Article] {
        let articles = dataParser.parseDataFromFile()
        return articles
    }
}
