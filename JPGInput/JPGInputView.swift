//
//  JGInput.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

protocol JPGInputDelegate: UITextFieldDelegate {
  func textFieldIsValid(_ textField: UITextField) -> Bool
}

public class JPGInput: UIView , UITextFieldDelegate {
  
  var delegate: JPGInputDelegate?
  var customInputContainer: UIView = UIView(frame: CGRect.zero)
  var customInputView: UITextField = UITextField(frame: CGRect.zero)
  var inputPlaceholder: UILabel = UILabel(frame: CGRect.zero)
  var inputLabelView: UILabel = UILabel(frame: CGRect.zero)
  var inputText: String = ""
  var inputError: Bool = false
  var label: String = ""
  var placeholder: String = ""
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience public init(label: String, placeholder: String) {
    self.init(frame: CGRect.zero)
    self.label = ""
    self.label = label
    self.inputText = ""
    self.placeholder = ""
    self.inputError = false
    self.placeholder = placeholder
    self.customInputContainer = UIView(frame: CGRect.zero)
    self.customInputView = UITextField(frame: CGRect.zero)
    self.inputPlaceholder = UILabel(frame: CGRect.zero)
    self.inputLabelView = UILabel(frame: CGRect.zero)
    
    setupViews()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    customInputContainer.backgroundColor = UIColor.clear
    
    customInputView.delegate = self
    customInputView.backgroundColor = UIColor.clear
    customInputView.font = UIFont(name: "Roboto-Regular", size: 12)
    
    inputLabelView.alpha = 0.0
    inputLabelView.text = self.label
    inputLabelView.backgroundColor = UIColor.clear
    inputLabelView.font = UIFont(name: "Roboto-Regular", size: 8)
    
    inputPlaceholder.text = self.placeholder
    inputPlaceholder.font = UIFont(name: "Roboto-Regular", size: 12)
    inputPlaceholder.textColor = UIColor.init(colorLiteralRed: 0.757, green: 0.757, blue: 0.757, alpha: 1.00)
    inputPlaceholder.backgroundColor = UIColor.clear
    
    self.addSubview(customInputContainer)
    self.addSubview(customInputView)
    self.addSubview(inputLabelView)
    self.addSubview(inputPlaceholder)
    
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    customInputContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    customInputContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    customInputContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    customInputView.translatesAutoresizingMaskIntoConstraints = false;
    customInputView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 10).isActive = true
    customInputView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    customInputView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    customInputView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    inputLabelView.translatesAutoresizingMaskIntoConstraints = false;
    inputLabelView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 2).isActive = true
    inputLabelView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    inputLabelView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputLabelView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    inputPlaceholder.translatesAutoresizingMaskIntoConstraints = false;
    inputPlaceholder.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
    inputPlaceholder.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 5).isActive = true
    inputPlaceholder.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputPlaceholder.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor, constant: 0).isActive = true
  }
  
  public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    if let del = self.delegate {
      if del.responds(to: #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:))) {
        return del.textFieldShouldBeginEditing!(textField)
      }
    }
    return true;
  }
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    fadeOut(viewToFadeOut: self.inputPlaceholder)
    fadeIn(viewToFadeIn: inputLabelView)
    self.delegate?.textFieldDidBeginEditing!(textField)
  }
  
  public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if let del = self.delegate {
      if del.responds(to: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:))) {
        return del.textFieldShouldEndEditing!(textField)
      }
    }
    return true;
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    if ((textField.text?.characters.count)! < 1) {
      fadeIn(viewToFadeIn: inputPlaceholder)
      fadeOut(viewToFadeOut: inputLabelView)
    }
    self.delegate?.textFieldDidEndEditing!(textField)
  }
  
  public func textFieldShouldClear(_ textField: UITextField) -> Bool {
    if let del = self.delegate {
      if del.responds(to: #selector(UITextFieldDelegate.textFieldShouldClear(_:))) {
        return del.textFieldShouldClear!(textField)
      }
    }
    return true
  }
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let del = self.delegate {
      if del.responds(to: #selector(UITextFieldDelegate.textFieldShouldReturn(_:))) {
        return del.textFieldShouldReturn!(textField)
      }
    }
    return true
  }
  
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let del = self.delegate {
      // We don't check for the selector here because textFieldIsValid is required
      self.inputError = !del.textFieldIsValid(textField)
    }
    
    inputText = (inputText as NSString).replacingCharacters(in: range, with: string)
    
    inputLabelView.textColor = inputError ? UIColor.red : UIColor.black
    
    // TODO: This needs to call the delegate methdo
    return true;
  }
  
  func fadeOut(viewToFadeOut: UIView){
    // Move our fade out code from earlier
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlUp,
      animations: {
       viewToFadeOut.alpha = 0.0
      },
      completion: { finished in
        if finished {
          print("finished fading out")
        }
      }
    )
  
  }
  
  func fadeIn(viewToFadeIn: UIView) {
    UIView.animate(
      withDuration: 0.5,
      delay: 0.0,
      options: .transitionCurlDown,
      animations: {
        viewToFadeIn.alpha = 1.0
      },
      completion: { finished in
        if finished {
          print("finished fading in")
        }
      }
    )
  }
}
