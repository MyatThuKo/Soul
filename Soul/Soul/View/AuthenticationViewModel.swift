//
//  AuthenticationViewModel.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    var session: APIServiceManager?
    var loginView: Bool = false
    
    func buttonAction(session: APIServiceManager, register: Bool) {
        self.session = session
        guard validateFields() else {
            return
        }
        if register {
            registerUser()
        } else {
            loginUser()
        }
    }
    
    func loginUser() {
        session?.login(email: email, password: password) { [weak self] (result: Result<Bool, APIError>) in
            guard let self = self else {
                return
            }
            switch result {
            case .success:
                break
            case .failure(let error):
                self.updateErrorMessage(error.debugDescription)
            }
        }
        
    }
    
    func registerUser() {
        let profileUpdateHandler = {[weak self] (result: Result<Bool, APIError>) in
            guard let self = self else {
                return
            }
            switch result {
            case .success:
               break
            case .failure(let error):
                self.updateErrorMessage(error.debugDescription)
            }
        }
        self.session?.register(email: self.email,
                              password: self.password,
                              handler: profileUpdateHandler)
    }
    
    func validateFields() -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            updateErrorMessage(APIError.allFieldsManditory.debugDescription)
            return false
        }
        guard email.isValidEmail else {
            updateErrorMessage(APIError.invalidEmail.debugDescription)
            return false
        }

        return true
    }
    
    func updateErrorMessage(_ message: String) {
        DispatchQueue.main.async  { [weak self] in
            self?.errorMessage = message
        }
    }
    
}
