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
    @Published var isLoggedIn: Bool =  true //Auth.auth().currentUser != nil
    
    // MARK: Functions
    func getUser() {
        if let user = Auth.auth().currentUser,
           let email = user.email,
           let displayName = user.displayName {
            self.user = User(
                uid: user.uid,
                email: email,
                userName: displayName
            )
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
            self.user = nil
        }
    }

    func login(email: String, password: String, handler: @escaping(Result<Bool, APIError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { response, error in
            if let user = response?.user,
               let email = user.email,
               let displayName = user.displayName {
                self.user = User(uid: user.uid, email: email, userName: displayName)
                self.isLoggedIn = true
                handler(.success(true))
            } else {
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

    func register(email: String, password: String, handler: @escaping(Result<Bool, APIError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { response, error in
            if let user = response?.user,
               let email = user.email,
               let displayName = user.displayName {
                self.user = User(uid: user.uid, email: email, userName: displayName)
                self.isLoggedIn = true
                handler(.success(true))
            } else {
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
