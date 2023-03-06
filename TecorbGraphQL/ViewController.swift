//
//  ViewController.swift
//  TecorbGraphQL
//
//  Created by Dinesh Saini on 28/02/23.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    var contacts: [LoadParkListQuery.Data.FetchCalendarEvents]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var watcher: GraphQLQueryWatcher<LoadParkListQuery>?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        self.loadQuery()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Load Query Data
    
    func loadQuery(){
        watcher = Network.shared.apollo.watch(query: LoadParkListQuery(page: 1, parkID: "1"), resultHandler: { result in
            switch result {
            case .success(let newResult):
                if let graphResult = newResult.data?.caldendarEvents{
                    DispatchQueue.main.async {
                        self.contacts = graphResult
                        self.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print("Error loading contacts: \(error.localizedDescription)")
            }
        })
    }
    

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        let detail = self.contacts?[indexPath.row]
        cell.eventName.text = "Event Name: " + (detail?.event?.eventName ?? "")
        cell.eventType.text = "Event Type: " + (detail?.event?.eventType ?? "")
        cell.startAndEndTime.text = "Start Time \(self.getModifiedDateFromDateString(detail?.event?.startTime ?? "", setFormat: "HH:mm", getFormat: "hh:mm a")) to End Time \(self.getModifiedDateFromDateString(detail?.event?.endTime ?? "", setFormat: "HH:mm", getFormat: "hh:mm a"))"
        cell.eventCreateBy.text = "Created By: \(detail?.event?.createdEmail ?? "")"
        cell.detail.text = "Description: \(detail?.event?.description ?? "")"
        print("create Date \(detail?.event?.createdAt ?? "")")
        let createDate = detail?.event?.createdAt ?? ""
        cell.dateTimeLabel.text = "Created At:  \(self.formattedDateWithString(createDate, format: "EEE, dd MMM YYYY"))"
        cell.selectionStyle = .none
        return cell
    }
    
    func getModifiedDateFromDateString(_ dateString: String,setFormat:String,getFormat:String) -> String
      {
          if dateString.isEmpty{return ""}
          let df  = DateFormatter()
          df.locale = Locale.autoupdatingCurrent
          df.timeZone = TimeZone.autoupdatingCurrent
          df.dateFormat = setFormat
          let date = df.date(from: dateString)!
          df.dateFormat = getFormat
          return df.string(from: date);
      }

    func formattedDateWithString(_ dateString: String,format :String) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "YYYY-MM-dd HH:mm:ssz"
        let dfs = dateString.replacingOccurrences(of: "T", with: " ")
        let dArray  = dfs.components(separatedBy: ".")
    
        if dArray.count>0{
            if let d = dayTimePeriodFormatter.date(from: dArray[0]) as Date?{
                dayTimePeriodFormatter.dateFormat = "hh:mm a, dd-MMM-YYYY"
                dayTimePeriodFormatter.dateFormat = format
                let formattedDate = dayTimePeriodFormatter.string(from: d)
                return formattedDate//date
            }
        }
        return " "
    }

    
    
}


class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventName:UILabel!
    @IBOutlet weak var startAndEndTime:UILabel!
    @IBOutlet weak var dateTimeLabel:UILabel!
    @IBOutlet weak var eventCreateBy:UILabel!
    @IBOutlet weak var detail:UILabel!
    @IBOutlet weak var eventType:UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




