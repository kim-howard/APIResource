//
//  ViewController.swift
//  APIResource
//
//  Created by sopthfg@gmail.com on 07/09/2019.
//  Copyright (c) 2019 sopthfg@gmail.com. All rights reserved.
//

import UIKit
import APIResource

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Location().log()
        NewLocation().log()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

