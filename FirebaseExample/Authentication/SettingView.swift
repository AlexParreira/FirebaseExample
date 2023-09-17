//
//  SettingView.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 16/09/23.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject{
    
    @Published var authProviders: [AuthProvideroption] = []
                                   
    func loadAuthProviders() {
        if let providers = try? AuthenticationManager.shared.getProviders(){
            authProviders = providers
        }
    }
    
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
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
    
}

struct SettingView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do {
                        try viewModel.signOut()
                        showSignInView =  true
                    }catch{
                        print(error)
                    }
                }
            }
            if viewModel.authProviders.contains(.email){
                emailSection
            }
            
        }
        .onAppear{
            viewModel.loadAuthProviders()
        }
        .navigationTitle("Settings")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingView(showSignInView: .constant(false))
        }
    }
}


extension SettingView {
    
    private var emailSection: some View {
        Section{
            Button("Reset Password"){
                Task{
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET!")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Update Password"){
                Task{
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD Update!")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Update Email"){
                Task{
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL Update!")
                    }catch{
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email functions")
        }
    }
}
