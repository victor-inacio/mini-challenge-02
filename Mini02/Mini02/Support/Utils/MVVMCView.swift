import UIKit

// Todas as ViewController implementarão esse protocol
// Essa protocol força as ViewController terem a propriedade modelView
protocol MVVMCView {
    
    associatedtype ViewModel
    var modelView: ViewModel! {get set}
}
