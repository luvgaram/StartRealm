//
//  ViewController.swift
//  MyDiary
//
//  Created by Eunjoo on 2017. 1. 30..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
        
        // Picture 객체 둘을 만들고 프로퍼티 값을 넣습니다.
        let firstPicture = Picture()
        firstPicture.url = "test01"
        let secondPicture = Picture()
        secondPicture.url = "test01"
        
        // Diary 객체를 만들고 프로퍼티 값을 넣습니다.
        let myDiary = Diary(value: [Date(), "안녕하세요", [firstPicture, secondPicture]]);
        
        // 트랜잭션 안에서 Realm에 Diary 객체를 추가합니다.
        try! realm.write {
            realm.add(myDiary)
        }
    }
}

