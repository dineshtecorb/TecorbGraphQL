//
//  LoginWithGraphQLViewController.swift
//  TecorbGraphQL
//
//  Created by Dinesh Saini on 06/03/23.
//

import UIKit
import Apollo

class LoginWithGraphQLViewController: UIViewController {
    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.text = "admin@example.com"
        self.passwordTextField.text = "password"
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginButton(_ sender:UIButton){
        guard let email = self.emailTextField.text else {
            self.showAlertWithViewController(self, title: "GraphQL Message", message: "Enter your email address")
            return
        }
        
        guard let password = self.passwordTextField.text else {
            self.showAlertWithViewController(self, title: "GraphQL Message", message: "Enter your password")
            return
        }
        
        if email.isEmpty{
            self.showAlertWithViewController(self, title: "GraphQL Message", message: "Enter your email address")
            return
        }
        
        if !validateEmail(email){
            self.showAlertWithViewController(self, title: "GraphQL Message", message: "Please enter a valid email")
            return
        }
        
        if password.isEmpty{
            self.showAlertWithViewController(self, title: "GraphQL Message", message: "Enter your password")
            return
        }
        
        self.loginWith(email, password)
    }
    
    // MARK: - Load Data
    
    func loginWith(_ email:String, _ password:String) {
        var param = Dictionary<String,String>()
        param.updateValue(email, forKey: "email")
        param.updateValue(password, forKey: "password")
        param.updateValue("fYjM0A9lm0MQlelUoEk97Q:APA91bEaeJlD_4BOcI1pxVhSFH4-XQW8iRgNkGMj-tAX0mvshLE8Ie01QsIl8aFWroRd8SdNodbsXfM3BJ8w1Fn-mdp74c6c1iTTOKQuaw8V1TsmRdXaOf7SZSLHgQEAUWCp9wBdg9A0", forKey: "deviceToken")
        param.updateValue("IOS", forKey: "deviceOs")
        param.updateValue("iPhone 8", forKey: "deviceModel")
        param.updateValue("Asia/Calcutta", forKey: "timezone")


        Network.shared.apollo.perform(mutation: UserSigninMutation(input: param.jsonObject)){result in

            switch result{

            case .success(let graphResult):
                print("Result detail is \(graphResult)")
                if let userData = graphResult.data?.signDetail{
                   // DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle:nil)
                       let listVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        self.navigationController?.pushViewController(listVC, animated: true)
                       // print("user detail is \(userData)")
                  //  }
                }
            case .failure(let error):
                print("Find error from in response \(error)")
            }

        }
    

    }
    
    func validateEmail(_ email : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if email.count == 0
        {
            return false
        }
        else if !emailTest.evaluate(with: email)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    
    func showAlertWithViewController(_ viewController: UIViewController?, title: String, message: String,completionBlock :(() -> Void)? = nil){
        var toastShowingVC :UIViewController!
        toastShowingVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController
        if let navigationController = toastShowingVC as? UINavigationController {
            toastShowingVC = navigationController.viewControllers.last
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel) { (action) in
            guard let handler = completionBlock else{
                alert.dismiss(animated: false, completion: nil)
                return
            }
            handler()
            alert.dismiss(animated: false, completion: nil)
        }
        alert.addAction(okayAction)
        alert.view.tintColor = .black
        
        if let vc = viewController {
            toastShowingVC = vc
        }
        toastShowingVC.present(alert, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
