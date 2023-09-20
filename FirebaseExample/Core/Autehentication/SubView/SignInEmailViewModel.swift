//
//  SignInEmailViewModel.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 19/09/23.
//

import Foundation


@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func singUp() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found")
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult)
    }
    
    func singIn() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
        
    }
}
