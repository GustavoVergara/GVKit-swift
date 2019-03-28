//
//  ViewController.swift
//  GVKit
//
//  Created by GustavoVergara on 01/30/2019.
//  Copyright (c) 2019 GustavoVergara. All rights reserved.
//

import UIKit
import GVKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "loading", style: .plain, closure: { (item) in
            if self.view.utils.hasLoadingOverlay {
                self.view.utils.removeLoadingOverlay()
            } else {
                self.view.utils.addLoadingOverlay()
            }
        })
    }

}
