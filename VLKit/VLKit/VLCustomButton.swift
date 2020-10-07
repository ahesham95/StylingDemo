//
//  VLCustomButton.swift
//  StylingDemo
//
//  Created by apple on 10/7/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation
import UIKit
public class VLCustomButton: UIButton {
    
    @IBInspectable var styleKey:String!{
        didSet {
            
            guard let styleDictionary = StyleManager.getStyleDictionary(for: (self.superclass.self?.description()) ?? "" )else{return}
            
            self.draw(from: styleDictionary)
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func draw(from styleDictionary:[String:Any])  {
        print(styleDictionary)
        guard let SingleComponentDictionary = styleDictionary[styleKey] as? [String:Any]else{return}
        
        
        
        if SingleComponentDictionary["cornerRadius"] != nil{
            if let cornerRadius = SingleComponentDictionary["cornerRadius"] as? String{
                self.layer.cornerRadius = cornerRadius.stringAsCGFloat
            }
        }
        
        if SingleComponentDictionary["BGColor"] != nil{
            if let BGColor = SingleComponentDictionary["BGColor"] as? String{
                self.backgroundColor = UIColor(hexString: BGColor)
            }
        }
        
        
        if SingleComponentDictionary["textColor"] != nil{
            if let textColor = SingleComponentDictionary["textColor"] as? String{
                self.tintColor = UIColor(hexString: textColor)
            }
        }
        
        
        if SingleComponentDictionary["borderWidth"] != nil{
                   if let borderWidth = SingleComponentDictionary["borderWidth"] as? String{
                    self.layer.borderWidth = borderWidth.stringAsCGFloat
                   }
               }
        
        
        if SingleComponentDictionary["borderColor"] != nil{
                          if let borderColor = SingleComponentDictionary["borderColor"] as? String{
                            self.layer.borderColor = UIColor(hexString: borderColor).cgColor
                          }
                      }
        
        if SingleComponentDictionary["fontName"] != nil{
            if let fontname = SingleComponentDictionary["fontName"] as? String{
                self.titleLabel?.font = UIFont(name:fontname, size: 20.0)
            }
        }
        
        
        if SingleComponentDictionary["shadow"] != nil{
            if let shadowDictionary = SingleComponentDictionary["shadow"] as? [String:String]{
                self.layer.shadowColor = UIColor(hexString: shadowDictionary["shadowColor"] ?? "").cgColor
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowOpacity = Float(shadowDictionary["shadowOpacity"]?.stringAsCGFloat ?? 0.0)
                self.layer.shadowRadius = shadowDictionary["shadowRadius"]?.stringAsCGFloat ?? 0.0
                       self.layer.masksToBounds = false
                   }
               }
        
       
        
        
        
        
    }
    
}

