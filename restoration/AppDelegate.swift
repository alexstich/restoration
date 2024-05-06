//
//  AppDelegate.swift
//  restoration
//
//  Created by Aleksey Grebenkin on 06.05.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var navigationController: UINavigationController!
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		self.navigationController = UINavigationController()

		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = self.navigationController
		window.makeKeyAndVisible()
		
		self.window = window
		
		initTabController()

		return true
	}
	
	func initTabController()
	{
		let redVc = RedController()
		let greenVc = GreenController()
		
		redVc.tabBarItem = UITabBarItem(title: "RED", image: nil, selectedImage: nil)
		greenVc.tabBarItem = UITabBarItem(title: "GREEN", image: nil, selectedImage: nil)

		let tabController = UITabBarController()
		tabController.tabBar.backgroundColor = .yellow
		tabController.viewControllers = [redVc, greenVc]
		
		navigationController.pushViewController(tabController, animated: false)
	}
}


extension UIImage {
	func setColor(_ color1: UIColor) -> UIImage
	{
		return autoreleasepool(invoking: { [weak self] () -> UIImage in
			UIGraphicsBeginImageContextWithOptions(self!.size, false, self!.scale)
			color1.setFill()
			
			let context = UIGraphicsGetCurrentContext()
			context?.translateBy(x: 0, y: self!.size.height)
			context?.scaleBy(x: 1.0, y: -1.0)
			context?.setBlendMode(CGBlendMode.normal)
			
			let rect = CGRect(origin: .zero, size: CGSize(width: self!.size.width, height: self!.size.height))
			context?.clip(to: rect, mask: self!.cgImage!)
			context?.fill(rect)
			
			let newImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			
			return newImage!
		})
	}
}
