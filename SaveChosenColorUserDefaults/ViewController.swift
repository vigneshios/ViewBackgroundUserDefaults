//
//  ViewController.swift
//  SaveChosenColorUserDefaults
//
//  Created by Vignesh on 15/01/19.
//  Copyright © 2019 Vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let color = UserDefaults.standard.colorForKey(key: "bg") ?? .white
        self.view.backgroundColor = color
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 101 {
            let color : UIColor = .red
            self.view.backgroundColor = color
            UserDefaults.standard.setColor(color: color, forKey: "bg")
        }
        
        else if sender.tag == 102 {
            let color : UIColor = .green
            self.view.backgroundColor = color
            UserDefaults.standard.setColor(color: color, forKey: "bg")
        }
        
        else if sender.tag == 103 {
            let color : UIColor = .blue
            self.view.backgroundColor = color
            UserDefaults.standard.setColor(color: color, forKey: "bg")
        }
        
        
    }
    
}

extension UserDefaults {
    
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        
        if let color = color {
            do {
                colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                set(colorData, forKey: key)
            }catch {debugPrint(error.localizedDescription)}
        }
    }
    
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: "bg") {
            do {
                color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
            }catch {debugPrint(error.localizedDescription)}
        }
        return color
    }
    
    
}
