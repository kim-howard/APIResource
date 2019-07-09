//
//  ViewController.swift
//  APIResource
//
//  Created by sopthfg@gmail.com on 07/09/2019.
//  Copyright (c) 2019 sopthfg@gmail.com. All rights reserved.
//

import UIKit
import APIResource

class ViewController: UIViewController {
    
    @IBOutlet weak var centerLabel: UILabel!
    
    // Thank you jsonplaceholder
    private let testAPIResource = APIResource("https://jsonplaceholder.typicode.com/posts/1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        request()
        simpleRequest()
    }
    
    private func request() {
        let dataTask = URLSession(configuration: .default).dataTask(with: testAPIResource.urlRequest()) { [weak self] (data, _, error) in
            guard let self = self else { return }
            var result = ""
            if let error = error {
                result = "Error: Check Your Error"
            }
            if let data = data {
                do {
                    let jsonData: TestModel = try JSONDecoder().decode(TestModel.self, from: data)
                    print(jsonData)
                    result = "Good !"
                } catch {
                    result = "Error with Decode Data"
                }
                DispatchQueue.main.async {
                    self.centerLabel.text = result
                }
            }
        }
        dataTask.resume()
    }
    
    private func simpleRequest() {
        testAPIResource.get { (data) in
            var result = ""
            if let data = data {
                do {
                    let jsonData: TestModel = try JSONDecoder().decode(TestModel.self, from: data)
                    print(jsonData)
                    result = "Good !"
                } catch {
                    result = "Error with Decode Data"
                }
                DispatchQueue.main.async {
                    self.centerLabel.text = result
                }
            }
        }
    }
}
