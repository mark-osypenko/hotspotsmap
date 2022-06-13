//
//  MapViewController.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Injected
    private let interactor: MapBusinessLogic

    // MARK: - Views
    private let mapView: MKMapView = .init()
    private let statusView: MapStatusView = .init()
    private let activityIndicator = UIActivityIndicatorView()

    init(interactor: MapBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.load(in: mapView.visibleMapRect, with: mapView.camera.centerCoordinateDistance)
    }

}

// MARK: - MapDisplayLogic

extension MapViewController: MapDisplayLogic {

    func display(annotations: [HotspotAnnotation]) {
        statusView.isHidden = true
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }

    func display(errorMessage: String) {
        mapView.removeAnnotations(mapView.annotations)
        statusView.statusLabel.text = errorMessage
        statusView.isHidden = false
    }

    func displayLoader() {
        activityIndicator.startAnimating()
    }

    func hideLoader() {
        activityIndicator.stopAnimating()
    }

}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        mapView.dequeue(for: annotation)
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        interactor.load(in: mapView.visibleMapRect, with: mapView.camera.centerCoordinateDistance)
    }

}

// MARK: - Private

private extension MapViewController {

    func setupView() {
        mapView.register(view: HotspotAnnotationView.self, for: HotspotAnnotation.self)
        mapView.register(view: HotspotsClusterAnnotationView.self, for: MKClusterAnnotation.self)
        mapView.delegate = self

        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(statusView)
        statusView.isHidden = true
        statusView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .label
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            statusView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusView.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 16),
            statusView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

}
