//
//  RedController.swift
//  restoration
//
//  Created by Aleksey Grebenkin on 06.05.24.
//

import UIKit
import Foundation

class RedController: CustomController, UIViewControllerRestoration
{
	static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? 
	{
		return RedController()
	}

	
	override func viewDidLoad() 
	{
		super.viewDidLoad()
		
		restorationIdentifier = "RedController"
		restorationClass = type(of: self)
	}
}
