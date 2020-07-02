//
//  ViewController.swift
//  Article
//
//  Created by Prerna Chauhan on 01/07/20.
//  Copyright © 2020 Prerna Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var media = [Media]()
    var user = [User]()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // Class Varibles
    var viewModel = ViewModel()
    var tableviewCellCount = 0
    var isFrenchSelected = false
    var fetchingMore = false
    var deafultImage = UIImage(named: "Empty-Image")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.allowsSelection = false
        self.tableView.sizeToFit()
        initialMethod()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// TableView
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.articlesArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 377
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //pagination: load news items when it requires
        checkForLastCell(with: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier:"TableViewCell") as! TableViewCell
        var data = viewModel.articlesArray[indexPath.row]
        cell.article_Content.text = data.content
        let comment = data.comments
        let sortComment  = String(comment!.shorted())
        cell.comment!.text! = "\(sortComment).K Comments"
        let like = data.likes
        let sortlike  = String(like!.shorted())
        cell.like!.text! = String("\(sortlike).K Likes")
        var mediaData = viewModel.articlesArray[indexPath.row]
        for mdata in mediaData.media{
            cell.article_Title!.text = mdata.title
            cell.article_Url!.text = mdata.url
        }
        for mdata in mediaData.user{
            cell.user_Name!.text = mdata.name + " " + mdata.lastname
            cell.user_descrip!.text = mdata.designation
        }
        
        
        return cell
        
    }
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
            let tableViewData = viewModel.articlesArray[indexPath.row]
            for mdata in tableViewData.user{
            if mdata.avatar.count == nil {
                (cell as? TableViewCell)?.user_Img.image = deafultImage
                print(indexPath.row)
                return
            } else {
                let encodedUrl = mdata.avatar.encodedUrl()
                print(encodedUrl as Any)
                // Checking Cache
                if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String:String]{
                    if let path = dict[(encodedUrl!.absoluteString as NSString) as String] {
                        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                            let img = UIImage(data: data)
                            // If cache is there, Loading into cell from Cache
                            (cell as? TableViewCell)?.user_Img.image = img
                            return
                        }
                    }
                }
                //lazy loading
                let session = URLSession.shared
                let imageURL = URL(string: (mdata.avatar!))
                let task = session.dataTask(with: imageURL!) { (data, response, error) in
                    guard error == nil else {
                        return
                    }
                    DispatchQueue.main.async {
                        NSLog("cell number \(indexPath.row)")
                        if let image = UIImage(data: data!) {
                            // calling from API
                            (cell as? TableViewCell)?.user_Img.image = image
                            // StoringImages into Cache
                            StorageImageViewController.storeImage(urlstring: (encodedUrl!.absoluteString as NSString) as String, img: image)
                        }
                    }
                }
                task.resume()
            }
            }
            for mdata in tableViewData.media{
                if mdata.image.count == nil {
                    (cell as? TableViewCell)?.atricle_img.image = deafultImage
                    print(indexPath.row)
                    return
                } else {
                    let encodedUrl = mdata.image.encodedUrl()
                    print(encodedUrl as Any)
                    // Checking Cache
                    if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String:String]{
                        if let path = dict[(encodedUrl!.absoluteString as NSString) as String] {
                            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                                let img = UIImage(data: data)
                                // If cache is there, Loading into cell from Cache
                                (cell as? TableViewCell)?.atricle_img.image = img
                                return
                            }
                        }
                    }
                    //lazy loading
                    let session = URLSession.shared
                    let imageURL = URL(string: (mdata.image!))
                    let task = session.dataTask(with: imageURL!) { (data, response, error) in
                        guard error == nil else {
                            return
                        }
                        DispatchQueue.main.async {
                            NSLog("cell number \(indexPath.row)")
                            if let image = UIImage(data: data!) {
                                // calling from API
                                (cell as? TableViewCell)?.atricle_img.image = image
                                // StoringImages into Cache
                                StorageImageViewController.storeImage(urlstring: (encodedUrl!.absoluteString as NSString) as String, img: image)
                            }
                        }
                    }
                    task.resume()
                }
            }
        }
}

//MARK:- Functions
extension ViewController {
    
    func initialMethod() {
        
        // isFrenchSelected
        isFrenchSelected = true
        
        // Navigation Title
        navigationItem.title = "Todays News"
        
        // Tableview Set Delegate And DataSource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Call pageSetup
        pageSetup()
    }
    
    // Show Activity Indicator
    func showActivityIndicator() {
        
        DispatchQueue.main.async {
            
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    // Hide Activity Indicator
    func hideActivityIndicator() {
        
        DispatchQueue.main.async {
            
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    // TableViewSetUp
    func tableViewSetup()  {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Checking Cell
    private func checkForLastCell(with indexPath:IndexPath) {
        if indexPath.row == (viewModel.articlesArray.count - 1) {
            if GlobalVariableInformation.instance().totalItems > viewModel.articlesArray.count {
                GlobalVariableInformation.instance().page += 1
                pageSetup()
            }
        }
    }
    
    // Initial page settings
    func pageSetup()  {
        
        showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.tableViewSetup()
            // API calling from viewmodel class
            self.viewModel.getServicecall()
            self.closureSetUp()
            self.hideActivityIndicator()
        }
    }
    
    // Closure initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.hideActivityIndicator()
            }
        }
        viewModel.errorMessage = { [weak self] (message)  in
            DispatchQueue.main.async {
                print(message)
                self?.hideActivityIndicator()
            }
        }
    }
}
