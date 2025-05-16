//
//  LoginViewModel.swift
//  Immich
//
//  Created by Raditya Kurnianto on 08/10/24.
//

import UIKit

class LoginViewModel: NSObject {
    var provider: LoginProvider?
    var onDataLoad: ((ApiResponse<User>) -> Void)?
}

extension LoginViewModel: Loadable {
    func fetch() {
        guard let param = provider else { return }
        
        Api.shared.request(endpoint: .login(provider: param)) { [weak self] (response : ApiResponse<User>) in
            if let _ = response.error {
                if let callback = self?.onDataLoad { callback(response) }
                return
            }
            
            if let user = response.data {
                user.toDataObject()
            }
            
            if let callback = self?.onDataLoad { callback(response) }
        }
    }
}
