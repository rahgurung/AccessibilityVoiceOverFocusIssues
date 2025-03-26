//
//  AnnouncementViewController.swift
//  AccessibilityVoiceOverFocusIssues
//
//  Created by Rahul Gurung on 02/03/25.
//

import UIKit

class AnnouncementViewController: UIViewController {
    
    let label = UILabel()
    let actionButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Set up label
        label.text = "Old Text"
        label.textAlignment = .center
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText

        // Set up button
        actionButton.setTitle("Tap Me", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = 8
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        // Create a stack view for centering
        let stackView = UIStackView(arrangedSubviews: [label, actionButton])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        // Center stack view
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
   }

   @objc func buttonTapped() {
       label.text = "Updated Text"
       
       // ❌ Without delay, focus remains stuck on the "New Button"
       UIAccessibility.post(notification: .announcement, argument: "Text updated")

       // ✅ With delay, focus correctly moves back to actionButton
//       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//           UIAccessibility.post(notification: .announcement, argument: "Text is updated")
//       }
   }
}

