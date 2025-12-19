import UIKit

class PagoCeldaTabla: UITableViewCell {
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var btnVerDetalles: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
