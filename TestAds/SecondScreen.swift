//
//  SecondScreen.swift
//  TestAds
//
//  Created by Ali on 6/5/23.
//

import UIKit

class SecondScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goToThirdScreen(){
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ThirdScreen") as? ThirdScreen

        navigationController?.pushViewController(nextViewController!, animated: true)

    }


}
