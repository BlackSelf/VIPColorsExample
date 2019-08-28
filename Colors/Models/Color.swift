//
//  Color.swift
//  Colors
//
//  Created by Alexander Vorobyev on 28/08/2019.
//  Copyright © 2019 Utkonos. All rights reserved.
//

import Foundation

typealias ColorID = Int

struct Color: Codable {
    var id: ColorID
    var hex: String
    var name: String
}
