//
//  SettingsViewModel.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 19/09/23.
//

import Foundation

@MainActor
final class SettingViewModel: ObservableObject{
    
    @Published var authProviders: [AuthProvideroption] = []
    @Published var authUser: AuthDataResultModel? = nil
    
    func loadAuthProviders() {
        if let providers = try? AuthenticationManager.shared.getProviders(){
            authProviders = providers
        }
    }
    
    func loadAuthUser(){
        self.authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
    }
    
    
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
    }
    
    func deleteAccount() async throws {
        try await AuthenticationManager.shared.delete()
    }
    
    func resetPassword() async throws{
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email  else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "teste123@gmail.com"
        
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "teste123"
        
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
    func linkGoogleAccount() async throws{
        let helper = SignInGoogleHelper()
        let token = try await helper.signIn()
        let authDataResult = try await AuthenticationManager.shared.linkGoogle(tokens: token)
        self.authUser = authDataResult
    }
    func linkAppleAccount() async throws{
            //code
    }
    func linkEmailAccount() async throws{
        let email = "teste123@gmail.com"
        let password = "teste123"
        let authDataResult = try await AuthenticationManager.shared.linkEmail(email: email, password: password)
        self.authUser = authDataResult
    }
}
