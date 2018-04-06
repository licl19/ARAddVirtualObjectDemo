//
//  ViewController.swift
//  ARAddVirtualObjectDemo
//
//  Created by lichanglai on 2018/4/6.
//  Copyright © 2018年 sankai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func presentARViewController(_ sender: UIButton) {
        sender.isEnabled = false
        present(ARSCNViewViewController(), animated: true) {
            sender.isEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

