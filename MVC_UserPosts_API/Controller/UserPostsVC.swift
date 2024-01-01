//
//  ViewController.swift
//  MVC_UserPosts_API
//
//  Created by Suresh Sindam on 12/28/23.
//

import UIKit

class UserPostsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var userPostsDataArr: [UserPostModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPosts()
    }
    
    func getPosts() {
        Services.shared.getUserPosts(completion: { [weak self] (fetchedPost) in
            guard let fetchedPost = fetchedPost else {
                return
            }
            self?.userPostsDataArr = fetchedPost
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }


}

extension UserPostsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPostsDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let posts = userPostsDataArr[indexPath.row]
        cell.textLabel?.text = posts.title
        cell.detailTextLabel?.text = posts.body
        return cell
    }
}

