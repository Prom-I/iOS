//
//  SettingGroupView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/10/15.
//


import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerViewModel: ObservableObject{
    @Published private(set) var selectedImage: UIImage? = UIImage(named: "1")
    @Published var imageSelection: PhotosPickerItem? = nil{
        didSet{
            setImage(from: imageSelection)
        }
    }
    private func setImage(from selection : PhotosPickerItem?){
        guard let selection else {return}
        
        Task{
            if let data = try? await selection.loadTransferable(type: Data.self){
                if let uiImage = UIImage(data: data){
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
    
}

struct SettingProfileView: View {
    @State private var Name:String = "이자민"
    @StateObject private var viewModel = PhotoPickerViewModel()
    

    
    var body: some View {
        NavigationView{
            VStack{
                
                PhotosPicker(selection: $viewModel.imageSelection, matching: .images){
                    ZStack(alignment:.bottomTrailing){
                        if let image = viewModel.selectedImage{
                            Image(uiImage: image)
                                .resizable()
                                .frame(width:104, height: 104)
                                .clipShape(Circle())
                            
                            
                            Circle()
                                .frame(width:24, height: 24)
                                .foregroundColor(Color.gray)
                                .overlay(
                                    Image(systemName: "camera")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.white)
                                )
                                .offset(x: 0, y: 0)
                            
                        }

                    }
                }
                .padding(.top, 50)
                
                TextField("이자민",text: $Name)
                    .padding(.top, 50)
                    .padding(.leading, 24)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 345, height: 1)
                  .background(.black)
                
                Text("\(Name.count) / 20")
                    .font(Font.custom("Pretendard", size: 12))
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing) // 좌측 정렬
                    .padding(.trailing, 24)
                
                
                    
                Spacer()
                
            }
            .padding(.horizontal, 24)
            .navigationTitle("프로필 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Text("확인"))       //Toolbar로 바꿔야함
            
        }
        
    }
}

struct SettingProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfileView()
    }
}

