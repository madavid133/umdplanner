//
//  SleepViewController.swift
//  umdplanner
//
//  Created by David Ma on 5/5/19.
//  Copyright © 2019 group42. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Charts

class SleepViewController: UIViewController {
    
    let dataSet = [1,3,4,2,5,2,7,5,3]
    var sleepPeriod = sleepTracker()
    
    @IBOutlet weak var lineChart: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues()
    }

    @IBAction func SleepButtonPreesed(_ sender: Any) {
        
    }
    
    func setChartValues(_ count : Int = 20) {
        var lineChartEntry = [ChartDataEntry]()
        for i in 0..<dataSet.count {
            let val = ChartDataEntry(x: Double(i), y: Double(dataSet[i]))
            lineChartEntry.append(val)
        }

        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")

        line1.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(line1)
        lineChart.data = data
        lineChart.chartDescription?.text = "Test Chart"
    }
}
