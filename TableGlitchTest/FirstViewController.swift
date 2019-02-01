//
//  FirstViewController.swift
//  TableGlitchTest
//
//  Created by Dmitry on 1/29/19.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let colors: [UIColor] = [.red, .blue, .green, .brown]
    
    var tableData: [CGFloat] = [218.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trayNib2 = UINib(nibName: "Simpl2TableViewCell", bundle: Bundle.main)
        tableView.register(trayNib2, forCellReuseIdentifier: "simpl2")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.update()
        }
    }
    
    func update() {
        let tableData2: [CGFloat] = [192.0, 148.0, 192.0, 148.0, 192.0]

        tableData.append(contentsOf: tableData2)
        insertIntoTableView(trays: tableData2)
    }
    
    func insertIntoTableView(trays: [CGFloat]) {
        guard trays.count > 0 else {
            return
        }
        
        let newlyAddedRowEndIndex = tableData.count - 1
        let newlyAddedRowStartIndex = (tableData.count - trays.count)
        let newlyAddedRowIndexPaths = (newlyAddedRowStartIndex...newlyAddedRowEndIndex).map({ IndexPath(row: $0, section: 0) })
        
        tableView.beginUpdates()
        tableView.insertRows(at: newlyAddedRowIndexPaths, with: .none)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpl2", for: indexPath) as! Simpl2TableViewCell
        
        cell.contentView.backgroundColor = colors[indexPath.row % 4]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableData[indexPath.row]
    }
     
    
}

