//
//  JGInput.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/9/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import UIKit

class JPGInput: UIView , UITextViewDelegate {
  
  var customInputContainer = UIView(frame: CGRect())
  var customInputView = UITextView(frame: CGRect())
  var customInputView2 = UITextField(frame: CGRect())
  var inputPlaceholder = UILabel(frame: CGRect())
  var inputLabelView = UILabel(frame: CGRect())
  var inputText = ""
  var inputError = false
  
  init() {
    super.init(frame: CGRect.zero)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    customInputContainer.translatesAutoresizingMaskIntoConstraints = false;
    customInputContainer.backgroundColor = UIColor.white
    
    customInputView.translatesAutoresizingMaskIntoConstraints = false;
    // Start text view scrolled to the top
    customInputView.scrollRangeToVisible(NSRange(location:0, length:0))
    
    customInputView.textContainer.maximumNumberOfLines = 1;
    customInputView.layoutManager.textContainerChangedGeometry(customInputView.textContainer)
    // customInputView.layer.borderColor = UIColor.blue.cgColor
    // customInputView.layer.borderWidth = 1
    
    customInputView.delegate = self
    customInputView.font = UIFont.boldSystemFont(ofSize: 10)
    
    customInputView2.translatesAutoresizingMaskIntoConstraints = false;
    customInputView2.layer.borderColor = UIColor.blue.cgColor
    customInputView2.layer.borderWidth = 1
    
    inputLabelView.translatesAutoresizingMaskIntoConstraints = false;
    // inputLabelView.layer.borderColor = UIColor.red.cgColor
    // inputLabelView.layer.borderWidth = 1
    inputLabelView.text = "Label"
    inputLabelView.alpha = 0.0
    inputLabelView.font = UIFont.boldSystemFont(ofSize: 8)
    
    inputPlaceholder.translatesAutoresizingMaskIntoConstraints = false;
    inputPlaceholder.text = "Label"
    inputPlaceholder.font = UIFont.boldSystemFont(ofSize: 12)
    inputPlaceholder.textColor = UIColor.init(colorLiteralRed: 0.757, green: 0.757, blue: 0.757, alpha: 1.00)
    
    self.backgroundColor = UIColor.magenta
    self.addSubview(customInputContainer)
    self.addSubview(customInputView)
    self.addSubview(inputLabelView)
    self.addSubview(customInputView2)
    self.addSubview(inputPlaceholder)
    
    setupLayout()
  }
  
  func sizeOfString (string: String, constrainedToWidth width: Double, font: UIFont) -> CGSize {
    return (string as NSString).boundingRect(with: CGSize(width: width, height: DBL_MAX),
                                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                     attributes: [NSFontAttributeName: font],
                                                     context: nil).size
  }
  
  func setupLayout() {
    customInputContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    customInputContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    customInputContainer.widthAnchor.constraint(equalToConstant: 1000).isActive = true
    customInputContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    customInputView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 10).isActive = true
    customInputView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
    customInputView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    customInputView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    inputLabelView.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
    inputLabelView.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
    inputLabelView.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputLabelView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
   inputPlaceholder.topAnchor.constraint(equalTo: customInputContainer.topAnchor, constant: 0).isActive = true
   inputPlaceholder.leftAnchor.constraint(equalTo: customInputContainer.leftAnchor, constant: 0).isActive = true
    inputPlaceholder.widthAnchor.constraint(equalTo: customInputContainer.widthAnchor, constant: 0).isActive = true
    inputPlaceholder.heightAnchor.constraint(equalTo: customInputContainer.heightAnchor, constant: 0).isActive = true
    // inputView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
    // inputView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    inputText = (inputText as NSString).replacingCharacters(in: range, with: text)
    
    // Makes an inputView act line a textField with only one line
    var textWidth = UIEdgeInsetsInsetRect(textView.frame, textView.textContainerInset).width
    textWidth -= 2.0 * textView.textContainer.lineFragmentPadding;
    let boundingRect = sizeOfString(string: inputText, constrainedToWidth: Double(textWidth), font: textView.font!)
    let numberOfLines = boundingRect.height / textView.font!.lineHeight;
    //////////////////////////////////////////////////////////////
    
    if (inputText.characters.count > 3) {
      inputError = true
    } else {
      inputError = false
    }
    inputLabelView.textColor = inputError ? UIColor.red : UIColor.black
    
    return numberOfLines <= 1;
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    // customInputView.backgroundColor = UIColor.gray
    fadeOut(viewToFadeOut: self.inputPlaceholder)
    fadeIn(viewToFadeIn: inputLabelView)
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    customInputView.backgroundColor = UIColor.clear
    if ((textView.text?.characters.count)! < 1) {
      fadeIn(viewToFadeIn: inputPlaceholder)
      fadeOut(viewToFadeOut: inputLabelView)
    }
  }
  
  func fadeOut(viewToFadeOut: UIView){
    // Move our fade out code from earlier
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionCurlUp, animations: {
    viewToFadeOut.alpha = 0.0
    }, completion: {
    finished in
    
    if finished {
      print("finished fading out")
    }
    })
  
  }
  
  func fadeIn(viewToFadeIn: UIView) {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionCurlDown, animations: {
    viewToFadeIn.alpha = 1.0
    }, completion: nil)
    
  }
}
