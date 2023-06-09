//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 08/06/23.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pageViewController = CustomPageViewController()
        return pageViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

class CustomPageViewController: UIPageViewController {
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        view.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
