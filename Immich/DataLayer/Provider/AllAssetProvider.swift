import Foundation

struct AllAssetProvider: ParamConvertible {
    var userId: String
    
    var parameters: [String : Any] {
        return Converter.toParameters(param: self)
    }
}
