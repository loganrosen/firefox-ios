// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import ComponentLibrary
import Common
import Foundation
import UIKit

class CardContainerViewController: UIViewController {
    private let loremIpsum =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
    sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """

    private lazy var cardContainer: CardContainer = .build { _ in }

    private lazy var contentLabel: UILabel = .build { label in
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        view.backgroundColor = .white
        contentLabel.text = loremIpsum
        let viewModel = CardContainerModel(view: contentLabel, a11yId: "CardContainer")
        cardContainer.configure(viewModel)

        let themeManager: ThemeManager = AppContainer.shared.resolve()
        cardContainer.applyTheme(theme: themeManager.currentTheme)
    }

    private func setupView() {
        view.addSubview(cardContainer)

        NSLayoutConstraint.activate([
            cardContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardContainer.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -20)
        ])
    }
}
