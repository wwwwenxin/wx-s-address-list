//
//  show.swift
//  wx's address list
//
//  Created by wx on 16/7/6.
//  Copyright © 2016年 wx's address list. All rights reserved.
//

import UIKit
class show: UIViewController {
    var db:SQLiteDB!
   
    @IBOutlet weak var x: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        initUser()
    }

    func initUser()
    {
        let data = db.query("select * from user")
        for var i=0 ; i < data.count; i++
        {
            //获取最后一行数据显示
            let u = data[i]
            x.text! += "\(i)"
            x.text! += "  name： "+String(u["uname"]!)+"  phone: "+String(u["mobile"]!)+"   address: "+String(u["address"]!)+"  email: "+String(u["email"]!)+"\n"
        }
    }

    
    
    @IBAction func clear(sender: AnyObject) {
        let c = "delete from user"
        let result = db.execute(c)
        print(result)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}