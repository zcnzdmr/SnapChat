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
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = CGFloat(500)
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        
        tableView.alwaysBounceVertical = false // block jumping or bouncing when you drag by tapping if it's false
        tableView.alwaysBounceHorizontal = false
        
        tableView.showsVerticalScrollIndicator = true // show an stick that allows you to see direction you scroll
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        
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
        cell.image2.image = UIImage(named: "bugs")
        cell.image.image = UIImage(named: "cat")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(CollectViewController(), animated: true)
    }

}
