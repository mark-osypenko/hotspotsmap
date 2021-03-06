//
//  HotspotsClusterAnnotationView.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import MapKit

class HotspotsClusterAnnotationView: MKAnnotationView {

    private let countLabel = UILabel()

    override var annotation: MKAnnotation? {
        didSet {
            guard let clusterAnnotation = annotation as? MKClusterAnnotation else { return }
            setup(using: clusterAnnotation)
        }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        backgroundColor = .systemBlue
        clipsToBounds = true

        addSubview(countLabel)
        countLabel.font = .boldSystemFont(ofSize: 14)
        countLabel.textAlignment = .center
        countLabel.textColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension HotspotsClusterAnnotationView {

    enum Constants {
        static let maxNumberOfMembers = 600
        static let minSideDimension: CGFloat = 30
        static let maxSideDimension: CGFloat = 120
        static let numberOfTypes = 4
    }

    func setup(using clusterAnnotation: MKClusterAnnotation) {
        backgroundColor = .systemBlue

        let step = Constants.maxNumberOfMembers / (Constants.numberOfTypes - 1)
        let sidesDiff = (Constants.maxSideDimension - Constants.minSideDimension) / CGFloat(Constants.numberOfTypes - 1)

        if clusterAnnotation.memberAnnotations.count >= Constants.maxNumberOfMembers {
            frame = .init(x: .zero, y: .zero, width: Constants.maxSideDimension, height: Constants.maxSideDimension)
        } else {
            (1..<Constants.numberOfTypes).forEach {
                let fromNumber = Constants.maxNumberOfMembers - $0 * step
                let toNumber = Constants.maxNumberOfMembers - ($0 - 1) * step

                if (fromNumber..<toNumber).contains(clusterAnnotation.memberAnnotations.count) {
                    let sideSize = Constants.maxSideDimension - sidesDiff * CGFloat($0)
                    frame = .init(x: .zero, y: .zero, width: sideSize, height: sideSize)
                }
            }
        }

        if clusterAnnotation.memberAnnotations.count > Constants.maxNumberOfMembers {
            countLabel.text = "\(Constants.maxNumberOfMembers)+"
        } else {
            countLabel.text = "\(clusterAnnotation.memberAnnotations.count)"
        }

        countLabel.frame = bounds
        layer.cornerRadius = frame.height / 2
    }

}

