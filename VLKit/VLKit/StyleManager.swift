//
//  StyleManager.swift
//  StylingDemo
//
//  Created by apple on 10/7/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation
class StyleManager{
    static func getStyleDictionary(for componentName:String) -> [String:Any]?{
        guard let path = Bundle.main.path(forResource: "StyleMap", ofType: "plist") else {return nil}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:Any] else {return nil}
        return plist[componentName] as! [String : Any]
    }
}
