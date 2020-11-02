import 'package:dio/dio.dart';

class API {
  Future matchFace(String imgPath) async {
    print('matchFace CALLED');
    var dio = Dio();
    
    Map<String, dynamic> data;

    // change this url to your photo url
    String imgUrl = 'https://thispersondoesnotexist.com/image';

    try {
      FormData formData = FormData.fromMap({
        'api_key': 'mEZeItQK7BdjiEzTTonVeQkJsRnIRyPs',
        'api_secret': 'bgBIGkVA-Zzd-s1hf8-CKbsm-27dEfzt',
        'image_url1': imgUrl,
        'image_file2': await MultipartFile.fromFile(imgPath)
      });

      var response = await dio.post('https://api-us.faceplusplus.com/facepp/v3/compare', data: formData)
        .timeout(Duration(seconds: 50));

      data = response.data;
    } catch (e) {
      print('matchFace ERR => $e');
    }

    return data;
  }
}