//
//  FirstVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class FirstVC: UIViewController {
    
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setUpTableViewUIs()
        self.navigationItem.title = "Home Page"
        self.tabBarController?.tabBar.backgroundColor = .black.withAlphaComponent(0.8) // determines the background color of tabBar

    }
    
    private func setUpTableViewUIs() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
//        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = CGFloat(300)
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        view.addSubview(tableView)
    }
}

extension FirstVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell else{
            fatalError("TableView Cell not found")
        }
        
        cell.label.text = "deneme"
        cell.image.image = UIImage(named: "cat")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(CollectViewController(), animated: true)
    }

}
