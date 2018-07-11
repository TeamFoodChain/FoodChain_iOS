import UIKit

class UploadstoreViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var deleteresponser = 0
     var array = ["a","b","c","d"]
    @IBOutlet weak var uploadTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadTV.delegate = self
        uploadTV.dataSource = self
        uploadTV.isEditing = true
        
    }
   

}
extension UploadstoreViewController : UITableViewDelegate{
    
}
extension UploadstoreViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            
            return true
            
        }else{
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "",message: "나의 냉장고에서 삭제하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
        //UIAlertActionStye.destructive 지정 글꼴 색상 변경
        let okAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
            self.array.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelButton)
        
        self.present(alertController,animated: true,completion: nil)
        
        
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 1{
            if (tableView.isEditing) {
                return UITableViewCellEditingStyle.delete
            }
            return UITableViewCellEditingStyle.none
            
        }
        else{
            return UITableViewCellEditingStyle.none
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        else{
            return array.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "uploademptyCell", for: indexPath) as! UploadstoreEmptyTableViewCell
          
            return cell
            
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "uploadCell", for: indexPath) as! UploadstoreTableViewCell
            return cell
        }
    }
    
    
}
