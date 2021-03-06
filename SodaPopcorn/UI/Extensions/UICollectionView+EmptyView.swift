//
//  UICollectionView+EmptyView.swift
//  SodaPopcorn
//
//  Created by Francisco Cordoba on 13/9/21.
//

import UIKit

extension UICollectionView {
	func setEmptyView(title: String, message: String, centered: Bool = false) {
		let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))

		let stack: UIStackView = {
			let stack = UIStackView()
			stack.axis = .vertical
			stack.distribution = .fillProportionally
			stack.alignment = .fill
			stack.translatesAutoresizingMaskIntoConstraints = false
			return stack
		}()

		let titleLabel: UILabel = {
			let label = UILabel()
			label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
			label.text = title
			label.numberOfLines = 0
			label.textAlignment = .center
			label.adjustsFontSizeToFitWidth = true
			label.adjustsFontForContentSizeCategory = true
			label.accessibilityLabel = title
			label.accessibilityHint = "No movie information title"
			return label
		}()

		let messageLabel: UILabel = {
			let label = UILabel()
			label.textColor = UIColor.lightGray
			label.font =  UIFont.preferredFont(forTextStyle: .body).bold()
			label.text = message
			label.numberOfLines = 0
			label.textAlignment = .center
			label.adjustsFontSizeToFitWidth = true
			label.adjustsFontForContentSizeCategory = true
			label.numberOfLines = 2
			label.accessibilityLabel = message
			label.accessibilityHint = "No movie information description"
			return label
		}()

		self.backgroundView = emptyView

		emptyView.addSubview(stack)
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(messageLabel)

		stack.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor).isActive = true
		stack.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor).isActive = true
		stack.heightAnchor.constraint(equalTo: emptyView.heightAnchor, multiplier: 0.15).isActive = true

		if centered {
			stack.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
		} else {
			stack.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 10).isActive = true
		}
	}

	func restore() {
		self.backgroundView = nil
	}
}
