//
//  Model.swift
//  Практический созвон
//
//  Created by Христина Буянова on 18.11.2023.
//

import Foundation

struct Model {
    var title: String
    var discription: String
    var image: String
    var isSwitch: Bool?
    var label: String?
}

extension Model {
    static var array: [Model] {
        [Model(title: "Settings title here", discription: "Setting status", image: "ilter", isSwitch: true),
         Model(title: "Notification", discription: "Setting status", image: "ilter", isSwitch: false),
         Model(title: "Settings title here", discription: "Setting status", image: "ilter"),
         Model(title: "Settings title here", discription: "Setting status", image: "ilter"),
         Model(title: "Settings title here", discription: "Setting status", image: "ilter"),
         Model(title: "About this app", discription: "Setting status", image: "ilter", label: "v2.0.21"),
         ]
    }
}
