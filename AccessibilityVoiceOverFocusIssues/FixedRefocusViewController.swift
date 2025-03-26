//
//  FixedRefocusViewController.swift
//  AccessibilityVoiceOverFocusIssues
//
//  Created by Rahul Gurung on 27/03/25.
//

import UIKit

class FixedRefocusViewController: UIViewController {
    let actionButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        actionButton.setTitle("Tap Me", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = 8
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    @objc private func buttonTapped() {
        createButton()

        // ❌ Focus remains stuck on the "New Button"
        //    UIAccessibility.post(notification: .layoutChanged, argument: self.actionButton)

        // ✅ With delay, focus correctly moves back to actionButton
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIAccessibility.post(notification: .layoutChanged, argument: self.actionButton)
        }
    }

    // Imagine this is some library method which you don't have access to
    func createButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Add a new focusable button (simulating a dynamic UI update)
            let newButton = UIButton()
            newButton.setTitle("New Button", for: .normal)
            newButton.backgroundColor = .systemGreen
            newButton.setTitleColor(.white, for: .normal)
            newButton.layer.cornerRadius = 8
            self.view.addSubview(newButton)

            newButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                newButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                newButton.topAnchor.constraint(equalTo: self.actionButton.bottomAnchor, constant: 20),
                newButton.widthAnchor.constraint(equalToConstant: 150)
            ])
            UIAccessibility.post(notification: .layoutChanged, argument: newButton)
        }
    }
}
