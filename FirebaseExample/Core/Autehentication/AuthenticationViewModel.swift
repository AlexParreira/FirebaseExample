//
//  AuthenticationViewModel.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 19/09/23.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject{
    
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        try await UserManager.shared.createNewUser(auth: authDataResult)

    }
    
    func signInAnonymous() async throws {
        let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
        try await UserManager.shared.createNewUser(auth: authDataResult)
    }
}
