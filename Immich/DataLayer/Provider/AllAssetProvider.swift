import Foundation

struct AllAssetProvider: ParamConvertible {
    var deviceId: String
    
    var parameters: [String : Any] {
        return Converter.toParameters(param: self)
    }
}
