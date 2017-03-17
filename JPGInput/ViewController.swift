//
//  ViewController.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, JPGInputDelegate {

  let formContainer = UIView(frame: CGRect())
  var customInputContainer = UIView(frame: CGRect())
  let jginput = JPGInput(label: "First name", placeholder: "First name")
  var customInputContainer2 = UIView(frame: CGRect())
  let jginput2 = JPGInput(label: "Last name", placeholder: "Last name")
  
  override func viewDidLoad() {
    jginput.delegate = self
    jginput2.delegate = self
    let formMargin = 10.0
    let borderWidth = 0.5
    let formWidth = view.frame.size.width - CGFloat(formMargin * 2)
    let inputWidth = formWidth - CGFloat(borderWidth * 2)
    
    super.viewDidLoad()
    view.backgroundColor = UIColor.init(colorLiteralRed: 0.965, green: 0.965, blue: 0.965, alpha: 1.00)
    
    formContainer.layer.borderColor = UIColor.init(colorLiteralRed: 0.627, green: 0.627, blue: 0.627, alpha: 1.00).cgColor
    formContainer.layer.borderWidth = CGFloat(borderWidth)
    formContainer.layer.cornerRadius = 2
    formContainer.backgroundColor = UIColor.white
    
    view.addSubview(formContainer)
//    view.addSubview(customInputContainer2)
    view.addSubview(jginput)
    view.addSubview(jginput2)
    
    formContainer.translatesAutoresizingMaskIntoConstraints = false;
    formContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    formContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(formMargin)).isActive = true
//    formContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
    formContainer.widthAnchor.constraint(equalToConstant: formWidth).isActive = true
    formContainer.heightAnchor.constraint(equalToConstant: 60 + CGFloat(borderWidth * 2)).isActive = true
    
//    print(customInputContainer.topAnchor)
    jginput.translatesAutoresizingMaskIntoConstraints = false;
    jginput.topAnchor.constraint(equalTo: formContainer.topAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput.leftAnchor.constraint(equalTo: formContainer.leftAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput.widthAnchor.constraint(equalToConstant: inputWidth).isActive = true
    jginput.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    
    jginput2.translatesAutoresizingMaskIntoConstraints = false;
    jginput2.topAnchor.constraint(equalTo: jginput.bottomAnchor, constant: 0).isActive = true
    jginput2.leftAnchor.constraint(equalTo: formContainer.leftAnchor, constant: CGFloat(borderWidth)).isActive = true
    jginput2.widthAnchor.constraint(equalToConstant: inputWidth).isActive = true
    jginput2.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("yup")
    return true
  }
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    print("begin")
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    print("end")
  }
  
  func textFieldIsValid(_ textField: UITextField) -> Bool {
    print("BROOOOOOO")
    return false
  }
  


}

