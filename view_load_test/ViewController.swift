//
//  ViewController.swift
//  view_load_test
//
//  Created by Alex Murphy on 2/15/19.
//  Copyright © 2019 thexande. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        title = "master"

        button.setTitle("push detail", for: .normal)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
    }


    @objc func tap() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}


final class DetailView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("DetailView layout")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("DetailView init")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


final class DetailViewController: UIViewController {

    private let detailView = DetailView()

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "detail"
    }
}
