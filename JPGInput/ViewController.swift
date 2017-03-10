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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let jginput = JPGInput()
    view.backgroundColor = UIColor.green
    
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.backgroundColor = UIColor.yellow
    
    jginput.backgroundColor = UIColor.blue
    view.addSubview(customInputContainer)
    view.addSubview(jginput)
    
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

//    customInputContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//    customInputContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//    customInputContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
//    customInputContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    
//    customInputView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 10).isActive = true
//    customInputView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
//    customInputView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
//    customInputView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//    
//    customInputView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
//    customInputView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//    customInputView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
//    customInputView2.heightAnchor.constraint(equalToConstant: 60).isActive = true
//    
//    
//    inputLabelView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
//    inputLabelView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
//    inputLabelView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
//    inputLabelView.heightAnchor.constraint(equalToConstant: 10).isActive = true
//    
//   inputPlaceholder.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
//   inputPlaceholder.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
//    inputPlaceholder.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
//    inputPlaceholder.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor, constant: 0).isActive = true
    
    
    
    // inputView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
    // inputView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

