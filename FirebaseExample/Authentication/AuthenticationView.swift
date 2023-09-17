//
//  AuthenticationView.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 16/09/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            
            NavigationLink{
                SignInEmailView(showSignInView: $showSignInView)
            }label: {
                Text("Sing In With Email")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sing In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AuthenticationView(showSignInView: .constant(false))
        }
    }
}
