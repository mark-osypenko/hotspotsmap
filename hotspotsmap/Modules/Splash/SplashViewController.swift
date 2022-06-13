//
//  SplashViewController.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - Injected
    private let interactor: SplashBusinessLogic

    // MARK: - Views
    private let progressBar = UIProgressView(progressViewStyle: .bar)
    private let statusLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()

    init(interactor: SplashBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.load()
    }

}

// MARK: - SplashDisplayLogic

extension SplashViewController: SplashDisplayLogic {

    func hideLoader() {
        activityIndicator.stopAnimating()
    }

    func display(progress: Float) {
        progressBar.progress = progress
    }

}

// MARK: - Private

private extension SplashViewController {

    func setupView() {
        // view
        view.backgroundColor = .systemBackground

        // topStackView
        let topStackView = UIStackView(arrangedSubviews: [statusLabel, activityIndicator])
        topStackView.spacing = 16

        // contentStackView
        let contentStackView = UIStackView(arrangedSubviews: [topStackView, progressBar])
        contentStackView.spacing = 16
        contentStackView.axis = .vertical

        // statusLabel
        statusLabel.font = .preferredFont(forTextStyle: .headline)
        statusLabel.text = L10n.loadingsStatus
        statusLabel.setContentHuggingPriority(activityIndicator.contentHuggingPriority(for: .horizontal) - 1, for: .horizontal)
        
        // activityIndicator
        activityIndicator.startAnimating()

        view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
