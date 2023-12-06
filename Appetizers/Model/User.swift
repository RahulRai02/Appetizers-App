//
//  User.swift
//  Appetizers
//
//  Created by Rahul Rai on 05/12/23.
//

import Foundation
import SwiftUI

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
