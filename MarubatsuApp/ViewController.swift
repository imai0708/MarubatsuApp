//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 今井菜月 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    //何問目が表示されているか格納する変数
    var currentQuestionNum: Int = 0
    
    // 問題  配列の中に辞書型が入っている  (連想配列)
        let questions: [[String: Any]] = [
            [
                "question": "iPhoneアプリを開発する統合環境はZcodeである",
                "answer": false
            ],
            [
                "question": "Xcode画面の右側にはユーティリティーズがある",
                "answer": true
            ],
            [
                "question": "UILabelは文字列を表示する際に利用する",
                "answer": true
            ]
        ]
    
    // 問題を表示する関数
    func showQuestion() {
        let question = questions[currentQuestionNum]

        //きちんと問題が入っているかの確認
        if let que = question["question"] as? String {
           //中身が入っていたら表示する
            questionLabel.text = que
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()

            showQuestion()
        }
    
    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {

        let question = questions[currentQuestionNum]

        if let ans = question["answer"] as? Bool {     //回答が入っているかの確認

            //回答が入っていればif文を実行
            if yourAnswer == ans {
                // 正解
                // currentQuestionNumを1足して次の問題に進む
                currentQuestionNum += 1
                showAlert(message: "正解！")
            } else {
                // 不正解
                showAlert(message: "不正解…")
                
                

            }
        } else {
            print("答えが入ってません")
            return
        }
        
        
       //全問終了段階で一問目に戻る
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }

        // 問題を表示します。
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    
    
    
    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)   //アラートを表示
        
        
        
    }
    
    
    
    
 
    @IBAction func tappedNoButton(_ sender: Any) {
        
        checkAnswer(yourAnswer: false)
        
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer:true)
        
    }
    
}

