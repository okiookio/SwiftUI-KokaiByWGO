//
//  WordFormView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct WordFormView: View {
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("SelectedLanguage") var selectedLanguage: String = "EN"
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var word: String = ""
    @State private var spell: String = ""
    @State private var meaning: String = ""
    @Binding var isShowInputItemView: Bool
    @Binding var spellingImages: [String]
    
    private var isButtonDisabled: Bool {
      word.isEmpty
    }
    
    // Note: - For Upload file
    @State private var swiftUIImage: SwiftUI.Image?
    @State private var imageSeleted: UIImage?
    @State private var filterIntensity = 0.5
    @State private var isShowingImagePicker: Bool = false
    @State private var inputImage: UIImage?
    @State var uploadedImageURL: String = ""
    
    
    
    // MARK: - FUNCTION
    func doLoadloadImage() {
        guard let inputImage = inputImage else { return }
        swiftUIImage = Image(uiImage: inputImage)
    }
    
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                // Note: - IMAGE BUTTON
                /*TextWithIconActionButton(imageName: "camera", text: text._addImage) {
                    // TODO : - Add camera function
                    print("Add Image")
                }*/
                
                // MARK: - Upload Photo
                if kIsUploadImage {
                    UploadImageView(swiftUIImage: $swiftUIImage, uploadedImageURL: $uploadedImageURL, isShowingImagePicker: $isShowingImagePicker)
                        .frame(height: kScreen.height * 0.2)
                        .sheet(isPresented: $isShowingImagePicker, onDismiss: doLoadloadImage) {
                            ImagePicker(image: self.$inputImage, imageSeleted: $imageSeleted)
                        }
                }
                // : - Upload Photo
                
                // Note: - SPELLING SELECTION BUTTON
                if spellingImages.count == 0 {
                    TextWithIconActionButton(imageName: "plus.circle", text: text._addSpell){
                        isShowInputItemView.toggle()
                    }
                } else {
                    Button(action: {
                        isShowInputItemView.toggle()
                    } , label: {
                        SpellingImagesListView(spellingImages: $spellingImages)
                    })
                }
                // Note: - INPUT FIELDS
                VStack(alignment: .leading) {
                    Text(text._wordLabel)
                        .modifier(InputLabelModifier())
                        
                    TextField(text._placeHolderWord, text: $word)
                        .modifier(InputFieldModifier())
                    
                    Text(text._spellLabel)
                        .modifier(InputLabelModifier())
                    TextField(text._placeHolderSpell, text: $spell)
                        .modifier(InputFieldModifier())
                    
                    Text(text._meaningEng)
                        .modifier(InputLabelModifier())
                    TextField(text._placeHolderMeaning, text: $meaning)
                        .modifier(InputFieldModifier())
                } //: VSTACK
                
                // Note: - SAVE BUTTON
                Button(action: {
                  // TODO : - Add Item
                    hideKeyboard()
                }, label: {
                  Spacer()
                  Text(text._save)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                  Spacer()
                })
                .disabled(isButtonDisabled)
                .onTapGesture {
                  if isButtonDisabled {
                    hideKeyboard()
                  }
                }
                .modifier(OkButtonModifier(word: $word))
                //:BOTTON
                
            }//: VSTACK
        }
        .onTapGesture {
            hideKeyboard()
        }
        //: SCROLLVIEW
    }
}

struct WordFormView_Previews: PreviewProvider {
    static var previews: some View {
        WordFormView(isShowInputItemView: .constant(false), spellingImages: .constant([]))
    }
}


/*

struct TodoItemForm: View {
    
    // Note: - For Upload file
    @State private var image: SwiftUI.Image?
    @State private var imageSeleted: UIImage?
    @State private var filterIntensity = 0.5
    @State private var isShowingImagePicker: Bool = false
    @State private var inputImage: UIImage?
    @State var uploadedImageURL: String = ""
    
    var body: some View {
        UITextView.appearance().backgroundColor = .clear
        // MARK: - ZStack
        return ZStack {
           
            // MARK: - VStack
            VStack {
 
                // Start Form
                VStack (alignment: .leading){
                    
                    // MARK: - Upload Photo
                    if kIsUploadImage {
                        UploadImageView(image: $image, uploadedImageURL: $uploadedImageURL, isShowingImagePicker: $isShowingImagePicker)
                            .frame(height: kScreen.height * 0.2)
                            //.padding(.leading, (screen.width - (screen.width * 0.5))/4 )
                            .sheet(isPresented: $isShowingImagePicker, onDismiss: doLoadloadImage) {
                                ImagePicker(image: self.$inputImage, imageSeleted: $imageSeleted)
                            }
                    }
                    // : - Upload Photo
                }.padding()
                .foregroundColor(Color(kFontColor))
                // End Form
                
                HStack(spacing: 5) {
 
                    
                    ButtonView(
                        text: objectId == "" ? "Save" : "Update",
                        backgroundColor: item == ""  ||  isDisableSaveBnt ? Color(kTerraCottaColor).opacity(0.6) : Color(kTerraCottaColor),
                        frameWidth: kScreen.width * 0.4) {
                        // Note: - For new item, check dupicate item before save to Firebase
                        isDisableSaveBnt = true
                        if objectId != "" {
                            prepareDataToFirebase()
                        }else {
                            checkIfDupicate { (isDuplicate) in }
                        }
                    }
                    .disabled(item == "" && isDisableSaveBnt)
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
            .onAppear(){
                // Note: - Check upload Image permission
                
                if (isShowItemFormScreen) {
                    if let row = selectedItemRow {
                        objectId = row.id
                        item = row.item
                        uploadedImageURL = row.imageURL
                        isDone = row.isDone
                        createdAt = row.createdAt
                    }
                }
                
                if let row = selectedRow {
                    todoListRefId = row.id
                } else {
                    isShowItemFormScreen = false
                }
                
            }
            .foregroundColor(.primary)
            .frame(width: kScreen.width * 0.95, height: kScreen.height * 0.85)
            // : - VStack
            // Remark: - Show Alert Message if dupicate Item
            
        }
        .edgesIgnoringSafeArea(.all)
        // : - ZStack
    }
    
    // MARK: - Helper Functions
    func checkIfDupicate(completion: @escaping (_ response:Bool?) -> Void) {
        self.todoItemsVM.checkDuplicate(_item: item) { (isDupcate) in
            // guard let isDupcate = isDupcate else { return  }
            if let isDupcate = isDupcate {
                // Note: - If duplicate
                if isDupcate {
                    isDuplicateItem = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isDuplicateItem = false
                    }
                    completion(true)
                } else {
                    prepareDataToFirebase()
                }
            }
        }
    }
    
    func doLoadloadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    private func doUploadImage(_ image: UIImage, completion: @escaping (_ imageURL: String)-> Void) {
        // Note: - check uploading image permission firse, if no permission then return empty string
        if kIsUploadImage {
            let fileDirectory = "word" + "/" + UUID().uuidString + ".jpg"

            FileStorage.uploadImage(image, directory: fileDirectory) { (imageURL) in
                
                FileStorage.saveImageLocally(imageData: image.jpegData(compressionQuality: 0.8)! as NSData, fileName: userListener.userData.passCode)
                
                if let newUploadedImageURL = imageURL {
                    // Note: - Remove the old file
                    if newUploadedImageURL != "" && uploadedImageURL != "" {
                        FileStorage.removeFileFromFirestore(fileURL: uploadedImageURL)
                    }
                    completion(newUploadedImageURL)
                } else {
                    completion("")
                }
            }
        } else {
            completion("")
        }
    }
    
    func prepareDataToFirebase(){
        // Note: - do upload file
        if let selectedImage = self.inputImage {
            self.doUploadImage(selectedImage) { (uploadedImageURL) in
                // BugToFix: - Should have the painning process
                if isDoUploadImage {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isDisableSaveBnt = false
                    }
                    self.uploadedImageURL = uploadedImageURL
                }
                // Note: - do save data
                saveDataToFirebase()
            }
        } else {
            // Note: - do save data
            saveDataToFirebase()
        }
    }
    
    func saveDataToFirebase(){
        print("> New URL : \(uploadedImageURL)")
        if objectId == "" {
            self.todoItemsVM.createRecord(
                _todoListRefId: todoListRefId,
                _item: item,
                _isDone: isDone,
                _imageURL: self.uploadedImageURL
            ) { (isSuccess) in   }
        } else {
            self.todoItemsVM.updateRecord(
                _objectId: objectId,
                _todoListRefId: todoListRefId,
                _item: item,
                _isDone: isDone,
                _imageURL: self.uploadedImageURL,
                _createdAt: createdAt
            ) { (isSuccess) in  }
        }
        // Note: - set value to default
        todoItemsVM.resetStrucValues()
        self.isShowItemFormScreen = false
    }
}

struct TodoItemForm_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemForm(isShowItemFormScreen: .constant(false), selectedRow: .constant(TodoModel()), todoItems: .constant([]), selectedItemRow: .constant(ItemModel()))
    }
}


 */
