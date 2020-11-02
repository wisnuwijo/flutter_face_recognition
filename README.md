# Face Recognition Flutter

**Clone the project**

    git clone https://github.com/wisnuwijo/flutter_face_recognition.git
**Install depedencies**

    flutter packages get
**Preview**
 - Homescreen
 
 ![enter image description here](https://raw.githubusercontent.com/wisnuwijo/flutter_face_recognition/master/Screen%20Shot%202020-11-02%20at%2017.31.24.png)
 - After verification

![enter image description here](https://raw.githubusercontent.com/wisnuwijo/flutter_face_recognition/master/Screen%20Shot%202020-11-02%20at%2017.31.45.png)

**Customize**

If you want to use your own image to compare follow these steps :

 1. Upload your own image and copy the url
 2. Head over to `lib/API/` folder, then open `api.dart`
 3. Change link in this variable `String imgUrl = 'https://thispersondoesnotexist.com/image';` to your image link
 4. Compile and you are ready to use it
