//
//  Diary.swift
//  MyDiary
//
//  Created by Eunjoo on 2017. 1. 30..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object {
    
    dynamic var date = Date()
    dynamic var text = ""
    var pictures = List<Picture>()
    
}
