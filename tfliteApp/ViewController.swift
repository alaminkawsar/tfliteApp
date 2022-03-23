//
//  ViewController.swift
//  tfliteApp
//
//  Created by Khayrul on 3/18/22.
//
import UIKit

class ViewController: UIViewController {
  private var modelParser: ModelParser? =
      ModelParser(modelFileInfo: ModelFile.modelInfo)
  @IBOutlet weak var textUserData: UITextField!
    
  @IBOutlet weak var textResult: UILabel!
  @IBAction func btnGo(_ sender: Any) {
    doInference()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  private func doInference() {
      
    guard let text = textUserData.text, text.count > 0 else {
      textResult.text = "0.00"
      return
    }
    guard let value = Float(text) else {
      return
    }
      guard let result = self.modelParser?.runModel(withInput: value) else {
          return
    }
    textResult.text = String(format: "%.2f", result)
  }

}
