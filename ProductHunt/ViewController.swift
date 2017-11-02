//
//  ViewController.swift
//  ProductHunt
//
//  Created by Andrew Tsukuda on 10/30/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let networkReq = Networking()
        networkReq.getPosts { (res) in
            print(res)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

