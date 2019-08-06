//
//  ArticlesPresenter.swift
//  RSSReader
//
//  Created Олег Крылов on 03/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//
//  Template generated by Edward
//

import Foundation

// MARK: View -
protocol ArticlesViewProtocol: AnyObject {
    func setupInitialState(with article: Article)
}

// MARK: Presenter -
protocol ArticlesPresenterProtocol: AnyObject {
	var view: ArticlesViewProtocol? { get set }
    func viewDidLoad()
}

final class ArticlesPresenter: ArticlesPresenterProtocol {

    weak var view: ArticlesViewProtocol?
    private let article: Article
    
    init(article: Article) {
        self.article = article
    }

    func viewDidLoad() {
        view?.setupInitialState(with: article)
    }
}
