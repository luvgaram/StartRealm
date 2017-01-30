//
//  ViewController.swift
//  MyDiary
//
//  Created by Eunjoo on 2017. 1. 30..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var diaries: Results<Diary>!
    var picturesArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readDiary()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(diaries.count)
        return diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "tableCell")
        cell.textLabel?.text = diaries[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    @IBAction func picOneButton(_ sender: Any) {
        picturesArray.add("01")
    }
    @IBAction func picTwoButton(_ sender: Any) {
        picturesArray.add("02")
    }
    @IBAction func picThreeButton(_ sender: Any) {
        picturesArray.add("03")
    }
    @IBAction func picFourButton(_ sender: Any) {
        picturesArray.add("04")
    }
    @IBAction func picFiveButton(_ sender: Any) {
        picturesArray.add("05")
    }
    @IBAction func picSixButton(_ sender: Any) {
        picturesArray.add("06")
    }
    @IBAction func picSevenButton(_ sender: Any) {
        picturesArray.add("07")
    }
    @IBAction func picEightButton(_ sender: Any) {
        picturesArray.add("08")
    }
    @IBAction func picNineButton(_ sender: Any) {
        picturesArray.add("09")
    }
    @IBAction func picTenButton(_ sender: Any) {
        picturesArray.add("10")
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // picturesArray 대로 Picture 객체를 만들고 프로퍼티 값을 넣습니다.
        
        let photos = List<Picture>()
        for fileName in picturesArray {
            let picture = Picture()
            picture.url = fileName as! String
            photos.append(picture)
        }
        
        // Diary 객체를 만들고 사용자가 입력한 프로퍼티 값을 넣습니다.
        let myDiary = Diary(value: [Date(), textView.text ?? "", photos]);
        
        // Realm에 Diary 객체를 저장합니다.
        addDiary(diary: myDiary)
        
        // 사용자 입력 정보를 초기화합니다.
        textView.text = ""
        picturesArray = NSMutableArray()
        self.tableView.reloadData()
    }
    
    func addDiary(diary: Diary) {
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
        
        // 트랜잭션 안에서 Realm에 Diary 객체를 추가합니다.
        try! realm.write {
            realm.add(diary)
        }
    }
    
    func readDiary() {
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
        
        // 모든 Diary 데이터를 읽어 옵니다.
        diaries = realm.objects(Diary.self)
    }
}

