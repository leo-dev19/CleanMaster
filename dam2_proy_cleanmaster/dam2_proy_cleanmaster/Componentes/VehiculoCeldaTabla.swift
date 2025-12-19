import UIKit

class VehiculoCeldaTabla: UITableViewCell {
    @IBOutlet weak var lblPlaca: UILabel!
    @IBOutlet weak var lblModelo: UILabel!
    @IBOutlet weak var btnVerDetalles: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

