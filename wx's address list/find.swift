//
//  find.swift
//  wx's address list
//
//  Created by wx on 16/7/11.
//  Copyright © 2016年 wx's address list. All rights reserved.
//

import UIKit
class find: UIViewController {
    
   
    var db:SQLiteDB!
    
    @IBOutlet var look: UITextField!

    @IBOutlet var up: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }

  
    @IBAction func serch(sender: AnyObject) {
        ss()
    }

    func ss(){
        let s=look.text!
        let data=db.query("select * from user where uname='\(s)'")
        for (var i=0;i<data.count;i++)
        {
            //获取最后一行数据显示
            let u = data[i]
            up.text!+="phone:"+String(u["mobile"]!)+"\n"+"address:"+String(u["address"]!)
        }
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}

