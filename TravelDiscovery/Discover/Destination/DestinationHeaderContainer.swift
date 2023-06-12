//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 08/06/23.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    let imageURLString: [String]
    let isBlackBackground: Bool
    var selectedIndex: Int = 0
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pageViewController = CustomPageViewController(imageURLString: imageURLString, isBlackBackground: isBlackBackground, selectedIndex: selectedIndex)
        return pageViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

import Kingfisher

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return selectedIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }

    lazy var allControllers: [UIViewController] = []
    let selectedIndex: Int
    init(imageURLString: [String], isBlackBackground: Bool, selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        allControllers = imageURLString.map({ imageName in
            let hostingController =
            UIHostingController(rootView: CarouselCustomBackground(imageName: imageName, isBlackBackground: isBlackBackground))
            hostingController.view.clipsToBounds = true
            return hostingController
            
        })
        if let first = allControllers.first {
            setViewControllers([first], direction: .forward, animated: true)
        }
        
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct CarouselCustomBackground: View {
    let imageName: String
    let isBlackBackground: Bool
    var body: some View {
        if isBlackBackground {
            ZStack {
                Color.black
                KFImage(URL(string: imageName))
                    .resizable()
                    .scaledToFit()
            }
        } else {
            KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
        }
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static let imagesURLString = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531"
    ]
    static var previews: some View {
        DestinationHeaderContainer(imageURLString: imagesURLString, isBlackBackground: false)
            .frame(height: 300)
    }
}
