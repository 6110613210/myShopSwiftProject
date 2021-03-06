//
//  ProductPage.swift
//  myShopFinal
//
//  Created by oontoon on 5/29/21.
//

import SwiftUI
import FirebaseAuth
struct ProductPage: View {
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()
    @StateObject var removeservice = RemoveService()
    @StateObject var updateproductservice = UpdateProductService()
    
    
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                Spacer()
                ForEach(self.profileService.posts, id:\.postID ) {
                    (post) in
                        PostCardImage(post: post)
                }
            }
        }.background(Color.white)
        .navigationTitle("")
        .navigationBarItems(leading: NavigationLink(destination: Post()){
            Text("Add Post")
        })
        .onAppear(){
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        }
    }
    
}



struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
