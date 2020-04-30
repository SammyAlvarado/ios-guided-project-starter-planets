//
//  SettingsViewController.swift
//  Planets
//
//  Created by Sammy Alvarado on 4/29/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingDelegate: class {
    func didTogglePluto()
}

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets number 8 step
    @IBOutlet weak var plutoSwitch: UISwitch!
    weak var delegate: SettingDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    
    @IBAction func toggledPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        delegate?.didTogglePluto()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        // Get a default
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
}
