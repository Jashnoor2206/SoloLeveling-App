//
//  LoginView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 02/07/26.
//

import SwiftUI

struct LoginView: View {
    @Binding var loginDone: Bool
    @State private var creds = Credentials() // only for username and password
    var details: Details
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: "CCE2CB")
                    .ignoresSafeArea()
                VStack(spacing: 40){
                    Text("Welcome Back").foregroundStyle(.white)
                        .font(.custom("Futura-Medium", size: 35, relativeTo: .body))
                        .foregroundStyle(Color(hex: "97C1A9"))
                    VStack(spacing: 20){
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.white)
                            .frame(maxWidth: 300, maxHeight: 50)
                            .overlay{
                                Button{
                                    
                                }label:{
                                    HStack{
                                        Image("google_logo")
                                            .resizable()
                                            .scaledToFit()
                                        Text("Continue with Google").foregroundStyle(.black)
                                    }.padding()
                                }
                            }
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.white)
                            .frame(maxWidth: 300, maxHeight: 50)
                            .overlay{
                                Button{
                                    
                                }label:{
                                    HStack{
                                        Image(systemName: "applelogo")
                                        Text("Continue with Apple")
                                    }.padding()
                                        .foregroundStyle(.black)
                                }
                            }
                        
                        RoundedRectangle(cornerRadius: 30)
                            .strokeBorder(.gray).opacity(0.5)
                            .frame(maxWidth: 300, maxHeight: 50)
                            .overlay{
                                HStack{
                                    if creds.email.isEmpty{ // this only displays envelope when field is empty
                                        Image(systemName: "envelope.fill")
                                    }
                                    TextField("Email", text: $creds.email)
                                        .foregroundStyle(.white)
                                }.padding()
                            }.foregroundStyle(.gray.opacity(0.5))
                        
                        VStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 30)
                                .strokeBorder(.gray).opacity(0.5)
                                .frame(maxWidth: 300, maxHeight: 50)
                                .overlay{
                                    HStack{
                                        if creds.password.isEmpty{ // same case here
                                            Image(systemName: "lock.fill")
                                        }
                                        SecureField("Password", text: $creds.password)
                                            .foregroundStyle(.white)
                                    }.padding()
                                }.foregroundStyle(.gray.opacity(0.5))
                            Text("Forgot Password")
                                .font(.custom("Futura-Medium", size: 15, relativeTo: .body))
                                .foregroundStyle(.white.opacity(0.8))
                                .frame(maxWidth: 280, alignment: .trailing)
                        }
                        
                    }.padding()
                    
                    VStack{
                        NavigationLink(destination: FirstUserDetails(details: details)){
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color(hex: "2D1B4E"))
                                .frame(maxWidth: 300, maxHeight: 50)
                                .overlay{
                                    Text("Log in").foregroundStyle(.white)
                                        .font(.custom("Futura-Medium", size: 20, relativeTo: .body))
                                }
                            
                        }.disabled(creds.email.isEmpty || creds.password.isEmpty)
                            .simultaneousGesture(TapGesture().onEnded(){
                                loginDone = true
                            })
                        Text("Dont have an account? Sign up")
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var loginDone = false
    @Previewable @State var details = Details()
    LoginView(loginDone: $loginDone, details: details)
}
