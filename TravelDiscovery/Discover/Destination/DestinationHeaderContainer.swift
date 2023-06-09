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

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource {
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
    
    
    let firstVC = UIHostingController(rootView: Text("First View Controller"))
    let secondVC = UIHostingController(rootView: Text("Second View Controller"))
    let thirdVC = UIHostingController(rootView: Text("Third View Controller"))
    lazy var allControllers: [UIViewController] = [firstVC, secondVC, thirdVC]
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        view.backgroundColor = .blue
        setViewControllers([firstVC], direction: .forward, animated: true)
        
        self.dataSource = self
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
