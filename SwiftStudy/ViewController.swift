//
//  ViewController.swift
//  List
//
//  Created by Takuro Mori on 2014/11/25.
//  Copyright (c) 2014年 Takuro Mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    //<グローバル変数宣言>
    //リスト
    var tableView = UITableView()
    //文字入力部分
    var textField = UITextField()
    //文字をリストに追加するボタン
    var inputButton = UIButton()
    //リストに表示する内容を積んでいく配列
    var inputArray : [String] = [String]()
    
    //<初期化>
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //(tableView setting)
        //位置・大きさ指定
        tableView.frame = CGRectMake(10, 100, 300, 400)
        //データソースをselfに設定
        tableView.dataSource = self
        //デリゲートをselfに設定
        tableView.delegate = self
        //tableView上のセルを一意に識別するためのIdentefierをつける
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        //tableViewをビューの上に貼付ける
        self.view.addSubview(tableView)
        
        //(textField setting)
        //位置・大きさ指定
        textField.frame = CGRectMake(10, 50, 200, 30)
        //デリゲートをselfに設定
        textField.delegate = self
        //入力部分の周りを線で囲む
        textField.borderStyle = UITextBorderStyle.RoundedRect
        //textFieldをビューの上に貼付ける
        self.view.addSubview(textField)
        
        //(Button setting)
        //位置・大きさ指定
        inputButton.frame = CGRectMake(220, 50, 80, 30)
        //ボタンの背景を赤に設定
        inputButton.backgroundColor = UIColor.redColor()
        //タイトルを設定する
        inputButton.setTitle("Input", forState: .Normal)
        //ボタンの角を丸くする
        inputButton.layer.cornerRadius = 20.0
        //ボタンが押された時に呼び出される関数を設定
        inputButton.addTarget(self, action: "INPUTbutton:", forControlEvents: .TouchUpInside)
        //inputButtonをビューの上に貼付ける
        self.view.addSubview(inputButton)
    }
    
    //<メモリが足りなくなった時>
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //<Inputボタンを押した時>
    func INPUTbutton(sender : UIButton){
        //配列に現在入力した文字を追加する
        inputArray.append(textField.text)
        //入力部分を初期化する
        textField.text = ""
        //リストを更新する
        tableView.reloadData()
    }
    
    //<文字入力中リターンキーを押した時>
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //キーボードを隠す
        textField.endEditing(true)
        
        return true
    }
    
    //<リストに表示する要素数>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の要素数を返す
        return inputArray.count
    }
    
    //<リストに表示する中身>
    //リストに表示する要素数分呼び出され、その度indexPath.rowの値でインクリメントが行われる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //既存のセルを定数として宣言する
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        //セル内のラベルに文字を代入する
        cell.textLabel.text = inputArray[indexPath.row]
        //セルを返す
        return cell
    }
}

