//
//  ResultViewController.swift
//  Quiz
//
//  Created by Sallivan James on 2021/02/11.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswer: Int = 0
    
    //結果を表示するラベル
    @IBOutlet var resultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "\(correctAnswer)トトロ！"
    }
    
    @IBAction func back(){
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
