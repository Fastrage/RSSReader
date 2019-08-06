//
//  ViewRouter.swift
//  RSSReader
//
//  Created by Олег Крылов on 05/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import UIKit

protocol ViewRouter {
    func present(_ viewControllerToPresent: UIViewController,
    animated flag: Bool,
    completion: (() -> Void)?)
}

extension ViewRouter {
    func present(_ viewControllerToPresent: UIViewController,
                 animated flag: Bool,
                 completion: (() -> Void)? = nil) { }
}
