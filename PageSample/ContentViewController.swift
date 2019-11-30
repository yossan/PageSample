//
//  ContentViewController.swift
//  PageSample
//
//  Created by Kosuke Yoshimoto on 2019/11/30.
//  Copyright © 2019 Kosuke Yoshimoto. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var number: Int = 0
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.label.text = String(self.number)
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
