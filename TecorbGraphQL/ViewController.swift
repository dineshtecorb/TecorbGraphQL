//
//  ViewController.swift
//  TecorbGraphQL
//
//  Created by Dinesh Saini on 28/02/23.
//

import UIKit
import Apollo
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    var contacts: [LoadParkListQuery.Data.FetchCalendarEvents]? {
        didSet {
           // guard let contact = contacts else {return}
           // print("loading data: \(contact)")
           // tableView.reloadData()
        }
    }
//
    
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
                    //let json = JSON(graphResult)
                    //print("loading data: \(json)")
                }

               // self.contacts = newResult.data?.allContacts
            case .failure(let error):
                print("Error loading contacts: \(error.localizedDescription)")
            }
        })
    }
    
    // MARK: - Load Data
    
    func loadData() {
        var param = Dictionary<String,String>()
        param.updateValue("admin@example.com", forKey: "email")
        param.updateValue("password", forKey: "password")
        param.updateValue("fYjM0A9lm0MQlelUoEk97Q:APA91bEaeJlD_4BOcI1pxVhSFH4-XQW8iRgNkGMj-tAX0mvshLE8Ie01QsIl8aFWroRd8SdNodbsXfM3BJ8w1Fn-mdp74c6c1iTTOKQuaw8V1TsmRdXaOf7SZSLHgQEAUWCp9wBdg9A0", forKey: "deviceToken")
        param.updateValue("IOS", forKey: "deviceOs")
        param.updateValue("iPhone 8", forKey: "deviceModel")
        param.updateValue("Asia/Calcutta", forKey: "timezone")


//        Network.shared.apollo.perform(mutation: UserSigninQuery(input: param.jsonObject)){result in
//
//            switch result{
//
//            case .success(let graphResult):
//                print("Result detail is \(graphResult)")
//                if let userData = graphResult.data?.userDetails{
//                    DispatchQueue.main.async {
//                        print("user detail is \(userData)")
//                    }
//                }
//                if let authData = graphResult.data?.authDetails{
//                    DispatchQueue.main.async {
//                        print("user detail is \(authData)")
//                    }
//                }
//
//            case .failure(let error):
//                print("Find error from in response \(error)")
//            }
//
//        }
    

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




