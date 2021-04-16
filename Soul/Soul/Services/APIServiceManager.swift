//
//  APIServiceManager.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI
import FirebaseAuth

class APIServiceManager: ObservableObject {

    // MARK: Properties
    @Published var user: User?
    @Published var isLoggedIn: Bool = Auth.auth().currentUser != nil
    
    // MARK: Functions
    func getUser() {
        if let user = Auth.auth().currentUser,
           let email = user.email {
            self.user = User(
                uid: user.uid,
                email: email,
                userName: user.displayName ?? "Joe"
            )
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
            self.user = nil
        }
    }

    func login(email: String, password: String, handler: @escaping(Result<Bool, APIError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { response, error in
            if let error = error {
                self.loginErrorHandling(error, handler: handler)
            } else {
                self.getUser()
                handler(.success(true))
            }
       
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.user = nil
        } catch {
            debugPrint("cannot signout")
        }
    }

    func register(email: String, password: String, displayName: String = "", handler: @escaping(Result<Bool, APIError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { response, error in
            if let error = error {
                self.loginErrorHandling(error, handler: handler)
            } else {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = displayName
                changeRequest?.commitChanges { error in
                    self.getUser()
                    handler(.success(true))
                }
            }
        }
    }
    
    func loginErrorHandling(_ error: Error?, handler: @escaping(Result<Bool, APIError>) -> Void) {
        self.isLoggedIn = false
        if let error = error, let errCode = Status(rawValue: error._code) {
            switch errCode {
            case .authErrorCodeWrongPassword:
                handler(.failure(.wrongPassword(message: error.localizedDescription)))
            case .authErrorCodeInvalidCredential:
                handler(.failure(.wrongEmailOrPassword))
            default:
                handler(.failure(.genericError(error: error)))
            }
        }
    }

    func updateEmailId(to email: String, handler: @escaping UserProfileChangeCallback) {
        Auth.auth().currentUser?.updateEmail(to: email, completion: handler)
    }

    func updatePassword(to password: String, handler: @escaping UserProfileChangeCallback) {
        Auth.auth().currentUser?.updatePassword(to: password, completion: handler)
    }

    func reauthenticate(password: String, handler: @escaping AuthDataResultCallback) {
        guard let user = Auth.auth().currentUser, let email = user.email else { return }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        user.reauthenticate(with: credential, completion: handler)
    }
}
