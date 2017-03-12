//
//  ViewController.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  let jginput = JPGInput()
  var customInputContainer = UIView(frame: CGRect())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.green
    
    customInputContainer.backgroundColor = UIColor.yellow
    
    jginput.backgroundColor = UIColor.blue
    view.addSubview(customInputContainer)
    view.addSubview(jginput)
    
    
  }
  
  
  func setupLayout() {
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    customInputContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    customInputContainer.widthAnchor.constraint(equalToConstant: 100000).isActive = true
    customInputContainer.heightAnchor.constraint(equalToConstant: 1000).isActive = true
    
//    print(customInputContainer.topAnchor)
    jginput.translatesAutoresizingMaskIntoConstraints = false;
    jginput.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
    jginput.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
    jginput.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor).isActive = true
    jginput.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor).isActive = true
    
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    setupLayout()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

