//
//  ViewController.swift
//  light
//
//  Created by Varun Saini on 29/07/25.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true

    @IBOutlet weak var lightButton: UIButton!

    func updateUI() {
    view.backgroundColor = lightOn ? .white : .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}


