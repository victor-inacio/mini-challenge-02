import UIKit

class DatePicker: UIDatePicker {
    
    init() {
        super.init(frame: .zero)
        
        datePickerMode = .date
        preferredDatePickerStyle = .compact
        translatesAutoresizingMaskIntoConstraints = false
        timeZone = .autoupdatingCurrent
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
