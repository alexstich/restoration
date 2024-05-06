//
//  GreenController.swift
//  restoration
//
//  Created by Aleksey Grebenkin on 06.05.24.
//

import UIKit

class GreenController: CustomController, UIViewControllerRestoration
{
	static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController?
	{
		return GreenController()
	}
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		restorationIdentifier = "RedController"
		restorationClass = type(of: self)
	}
}

