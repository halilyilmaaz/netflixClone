//
//  Extensions.swift
//  netflix
//
//  Created by halil yılmaz on 3.05.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter()->String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
