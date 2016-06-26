//
//  ViewController.swift
//  DownCounter
//
//  Created by Holin on 06/26/2016.
//  Copyright (c) 2016 Holin. All rights reserved.
//

import UIKit
import DownCounter

class ViewController: UIViewController {
  
  var downCounter: DownCounter? = nil
  
  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
    downCounter = DownCounter(count: 10, step: 2.0)
    downCounter?.delegate = self
    downCounter?.start()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension ViewController: DownCounterDelegate {
  func update(count: Double) {
    print("ViewController count ", count)
  }
  
  func finished() {
    print("ViewController finished at ", NSDate().description)
    
    print("down counter will restart")
    downCounter?.start()

  }
}

