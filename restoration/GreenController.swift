//
//  GreenController.swift
//  restoration
//
//  Created by Aleksey Grebenkin on 06.05.24.
//

import UIKit

class GreenController: UIViewController
{
	var lableText: String = "Some data for restoring" {
		didSet {
			label.text = lableText
		}
	}
	
	var topTitle: UILabel =
	{
		let label = UILabel()
		label.text = "GreenController"
		label.textAlignment = .center
		label.numberOfLines = 3
		label.textColor = .white
		return label
	}()
	
	var label: UILabel =
	{
		let label = UILabel()
		label.text = "Some data for restoring"
		label.textAlignment = .center
		label.numberOfLines = 3
		label.textColor = .white
		return label
	}()
	
	let btn: UIButton = {
		let button = UIButton()
		button.setTitle("Change label text", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .orange
		button.layer.cornerRadius = 10
		button.clipsToBounds = true
		return button
	}()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 5/255, green: 218/255, blue: 104/255, alpha: 1)

		topTitle.translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		btn.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(topTitle)
		view.addSubview(label)
		view.addSubview(btn)
		
		NSLayoutConstraint.activate([
			
			topTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			topTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			topTitle.widthAnchor.constraint(equalToConstant: 200),
			topTitle.heightAnchor.constraint(equalToConstant: 100),
			
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			label.widthAnchor.constraint(equalToConstant: 200),
			label.heightAnchor.constraint(equalToConstant: 100),
			
			btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			btn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
			btn.widthAnchor.constraint(equalToConstant: 200),
			btn.heightAnchor.constraint(equalToConstant: 50)
		])
		
		btn.addTarget(self, action: #selector(changeTextInLabel), for: .touchUpInside)
	}
	
	@objc
	private func changeTextInLabel()
	{
		lableText = generateRandomWords()
	}
	
	func generateRandomWords() -> String {
		let wordList = ["apple", "banana", "cherry", "date", "elderberry", "fig", "grape", "honeydew", "kiwi", "lemon", "mango", "nectarine", "orange", "papaya", "quince", "raspberry", "strawberry", "tangerine", "ugli", "watermelon"]
		var randomWords = [String]()
		
		for _ in 0..<20 {
			let randomIndex = Int.random(in: 0..<wordList.count)
			randomWords.append(wordList[randomIndex])
		}
		
		return randomWords.joined(separator: " ")
	}
}

