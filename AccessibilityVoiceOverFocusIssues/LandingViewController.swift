//
//  Landing.swift
//  AccessibilityVoiceOverFocusIssues
//
//  Created by Rahul Gurung on 27/03/25.
//

import UIKit

class LandingViewController: UITableViewController {

    let options = ["Announcements bug", "Refocus bug", "Announcements (fixed)", "Refocus (fixed)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Options"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedOption = options[indexPath.row]
        let viewController: UIViewController
        
        switch selectedOption {
        case "Announcements bug":
            viewController = AnnouncementViewController()
        case "Refocus bug":
            viewController = RefocusViewController()
        case "Announcements (fixed)":
            viewController = FixedAnnouncementViewController()
        case "Refocus (fixed)":
            viewController = FixedRefocusViewController()
        default:
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
