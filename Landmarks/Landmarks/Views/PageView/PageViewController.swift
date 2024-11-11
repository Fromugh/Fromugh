//
//  PageViewController.swift
//  Landmarks
//
//  Created by Sungjae Heo on 11/8/24.
//

import SwiftUI
import UIKit

/* SwiftUI calls makeUIViewController() method when it ready do show View,
and calls updateUIViewController when ViewController must be update. */
// Stores an array of Page instances, which must be a type of View.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController { // SwiftUI calls this method a single time when it's ready to display the view, and then manages the view controller's life cycle.
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        // This method calls setViewController(_:direction:animated:) to provide a view controller for display.
        
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
        // Creating UIHostingController that hosts the page SwiftUI view on every update.
        // Later, I'll make this more efficient by initializing the controller only once for the life of the page view controller.
    }
    
    class Coordinates: NSObject {
        // NSObject는 Objective-C 및 Swift 프로그래밍 언어의 기본 클래스이며, 대부분의 다른 클래스의 루트 클래스 역할을 한다고 함.
        // Coordinate class는 인스턴스를 초기화할 때 PageViewCotroller 타입을 매개변수로 받아서 인스턴스 변수 parent에 저장함.
        // https://clamp-coding.tistory.com/438 NSObject에 대한 설명
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
        }
        
        
    }
}
