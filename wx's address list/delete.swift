//
//  delete.swift
//  wx's address list
//
//  Created by wx on 16/7/6.
//  Copyright © 2016年 wx's address list. All rights reserved.
//

import UIKit
class delete: UIViewController {
    
       var db:SQLiteDB!


    @IBOutlet weak var ss: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
}






    @IBAction func pop(sender: AnyObject) {
        dell()
    }

    func dell(){
        let b=ss.text!
        let sql = "delete from user where uname='\(b)'"
        let result = db.execute(sql)
        print(result)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

