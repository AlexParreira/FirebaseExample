//
//  SettingView.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 16/09/23.
//

import SwiftUI


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
            Button(role: .destructive){
                Task{
                    do {
                        try await viewModel.deleteAccount()
                        showSignInView =  true
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Delete Account")
            }
            if viewModel.authProviders.contains(.email){
                emailSection
            }
   
            if viewModel.authUser?.isAnonymous == true {
                anonymousSection
            }
            
        }
        .onAppear{
            viewModel.loadAuthProviders()
            viewModel.loadAuthUser()
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
    
    private var anonymousSection: some View {
        Section{
            Button("Link Google Account"){
                Task{
                    do {
                        try await viewModel.linkGoogleAccount()
                        print("Google Linked!")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Link Apple Account"){
                Task{
                    do {
                        try await viewModel.linkAppleAccount()
                        print("Apple Linked!")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Link Email"){
                Task{
                    do {
                        try await viewModel.linkEmailAccount()
                        print("Email Linked!")
                    }catch{
                        print(error)
                    }
                }
            }
        } header: {
            Text("Link Account")
        }
    }
}
