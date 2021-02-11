//
//  QuizViewController.swift
//  Quiz
//
//  Created by Sallivan James on 2021/02/11.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceBotton1: UIButton!
    @IBOutlet var choiceBotton2: UIButton!
    @IBOutlet var choiceBotton3: UIButton!


    
    //クイズデータを格納しシャッフルするメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、3つの選択肢、答えの番号が入った配列を追加
        quizArray.append(["「千と千尋の神隠し」より、ハクが働いている温泉宿の名前は？","スーパー銭湯","油屋","ルネッサンス",2])
        quizArray.append(["「ハウルの動く城」より、ハウルと契約を交わした悪魔の名前は？","カルシファー","荒地の魔女","トトロ",1])
        quizArray.append(["「紅の豚」より、主人公である豚人間、通称「ポルコ・ロッソ」の本名は？","モジョリーノ・アルテマ","ディアル・ガッソ","マルコ・パゴット",3])
        quizArray.append(["「崖の上のポニョ」より、宗介が通っている保育園の名前は？","海の見える丘園","さつき園","ひまわり園",3])
        quizArray.append(["「魔女の宅急便」より、主人公キキの父親の名前は？","キモト","オキノ","イツキ",2])
        quizArray.append(["「となりのトトロ」より、スタジオジブリのシンボルマークとしてトトロが使用されているが、これは何の作品以降に使用されているか？","魔女の宅急便","千と千尋の神隠し","ゲド戦記",1])
        
        //問題文をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //問題文と選択肢をラベルに表示させるメソッド
    func choiceQuiz(){
        print("表示")
        
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を設定
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢を設定
        choiceBotton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceBotton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceBotton3.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    
    
    //自動で結果画面にいくように設定
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
        
    }
    
    
    
    //セグエを準備(prepare)する時に呼ばれるメソッド
    //正解値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    //選択肢のボタンの動作について
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = quizArray[0] as! [Any]
        print("aaaaaaa")
        
        
        //sender.tagでクイズの正解番号とタグ番号を比較し正誤を判定
        if tmpArray[4] as! Int == sender.tag{
            
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        }else{
            viewDidLoad()
            print("cccccccc")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
