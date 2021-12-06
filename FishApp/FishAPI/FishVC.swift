//
//  FishVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/5/21.
//

import UIKit

class FishVC: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let fishHelper = FishHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()

        // Do any additional setup after loading the view.
    }

    var activity: Activity? {
        didSet {
            updateUI()
        }
    }
    
    
    func toggleActivity()
    {
        DispatchQueue.main.async {
            if self.activityIndicator.isAnimating{
                self.activityIndicator.stopAnimating()
            }else {
                self.activityIndicator.startAnimating()
            }
        }
    }

    func updateUI(){
        OperationQueue.main.addOperation {
            let ask = self.activity?.activity ?? ""
            self.activityIndicator?.stopAnimating()
            self.activityLabel?.text = ask
        }
        toggleActivity()
    }
    func loadRequest(){
        activityLabel.text = ""
        activityIndicator?.startAnimating()

        fishHelper.fetchActivity(for: "activity"){result in
            switch result {
                case let .Success(activity):
                    OperationQueue.main.addOperation() {
                        self.activityIndicator?.stopAnimating()
                        self.activity = activity
                    }
                case let .Failure(error):
                    OperationQueue.main.addOperation() {
                        self.activityIndicator?.stopAnimating()
                        print("Error : \(error)")

                    }
//                    self.activityIndicator?.stopAnimating()
//                    self.activity = Bored()
            }
        }
    }

    @IBAction func onChangeAsk(_ sender: Any) {
        loadRequest()

    }
}

