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
		redVc.topTitleText = "RedController"
		redVc.backgroundColor = UIColor(red: 243/255, green: 51/255, blue: 51/255, alpha: 1)

		let greenVc = GreenController()
		greenVc.topTitleText = "GreenController"
		greenVc.backgroundColor = UIColor(red: 5/255, green: 218/255, blue: 104/255, alpha: 1)
		
		redVc.tabBarItem = UITabBarItem(title: "RED", image: nil, selectedImage: nil)
		greenVc.tabBarItem = UITabBarItem(title: "GREEN", image: nil, selectedImage: nil)

		let tabController = UITabBarController()
		tabController.tabBar.backgroundColor = .yellow
		tabController.viewControllers = [redVc, greenVc]
		
		navigationController.pushViewController(tabController, animated: false)
	}
}
