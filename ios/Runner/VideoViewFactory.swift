//
//  VideoViewFactory.swift
//  Runner
//
//  Created by 张留岗 on 4/28/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter

class VideoView: UIView, FlutterPlatformView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		let label = UILabel(frame: .zero)
		label.text = "Video Player"
		label.translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
			])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func view() -> UIView {
		return self
	}
	
	
}

class VideoViewFactory: NSObject, FlutterPlatformViewFactory {
	func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
		return VideoView(frame: frame)
	}
	

}
