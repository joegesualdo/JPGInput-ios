//
//  ViewController.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  var customInputContainer = UIView(frame: CGRect())
  let jginput = JPGInput(label: "First Name", placeholder: "What's your first name")
  var customInputContainer2 = UIView(frame: CGRect())
  let jginput2 = JPGInput(label: "Last Name", placeholder: "What's your last name")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.green
    
    customInputContainer.backgroundColor = UIColor.yellow
    
    jginput.backgroundColor = UIColor.blue
    view.addSubview(customInputContainer)
    view.addSubview(customInputContainer2)
    view.addSubview(jginput)
    view.addSubview(jginput2)
    
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    customInputContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    customInputContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
    customInputContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    customInputContainer2.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    customInputContainer2.leftAnchor.constraint(equalTo: customInputContainer.rightAnchor, constant: 0).isActive = true
    customInputContainer2.widthAnchor.constraint(equalToConstant: 200).isActive = true
    customInputContainer2.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
//    print(customInputContainer.topAnchor)
    jginput.translatesAutoresizingMaskIntoConstraints = false;
    jginput.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
    jginput.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
    jginput.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor).isActive = true
    jginput.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor).isActive = true
    
    jginput2.translatesAutoresizingMaskIntoConstraints = false;
    jginput2.topAnchor.constraint(equalTo: customInputContainer2.topAnchor, constant: 0).isActive = true
    jginput2.leftAnchor.constraint(equalTo: customInputContainer2.leftAnchor, constant: 0).isActive = true
    jginput2.widthAnchor.constraint(equalTo: customInputContainer2.widthAnchor).isActive = true
    jginput2.heightAnchor.constraint(equalTo: customInputContainer2.heightAnchor).isActive = true
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

