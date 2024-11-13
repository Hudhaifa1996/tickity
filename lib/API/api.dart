import 'package:dio/dio.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import com.facebook.FacebookSdk;
// import com.facebook.appevents.AppEventsLogger;

class API {
  final dio = Dio();

  Future<Response> getData({required String URL, Map<String,dynamic>? queryParameters}) async {
    Response response = await dio.get(URL,
        queryParameters: queryParameters
    );
    return response;
  }




  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<List> governorates() async {
    Response response = await dio
        .get("https://api.tickity.test-alphaber-iq.cloud/api/governorate");
    return response.data;
  }



  Future<List<dynamic>> collection() async {
    Response response = await dio.get(
        "https://api.tickity.test-alphaber-iq.cloud/api/customer/collections");
    return response.data["collections"]
        .map((item) => [item["id"], item["order"]])
        .toList();
  }

  Future<List<dynamic>> category() async {
    Response response = await dio.get(
        "https://api.tickity.test-alphaber-iq.cloud/api/customer/categories");
    return response.data["categories"]
        .map((item) => [
              item["id"],
              item["order"],
              item["name"],
              item["color"],
              item["iconUrl"]
            ])
        .toList();
  }

  Future<List<Response>> event() async {
    List<Response> response = [];
    List<dynamic> collection = await API().collection();
    List<dynamic> category = await API().category();

    for (var i = 0; i < collection.length; i++) {
      for (var j = 0; j < category.length; j++) {
        response.add(await dio.get(
          "https://api.tickity.test-alphaber-iq.cloud/api/customer/events",
          queryParameters: {
            "CollectionId": collection[i],
            "CategoryId": category[j],
            "PageNumber": 1,
            "PageSize": 10
          },
        ));
      }
    }
    return response;
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print("Error during Google Sign-In: $error");
      return null;
    }
  }

  Future<void> signOutWithGoogle() async {
    await _googleSignIn.signOut();
  }
//   Future<AccessToken?> signInWithFacebook() async {
//   //   try {
//   //     final AccessToken accessToken = await FacebookAuth.instance.login();
//   //     return FacebookAuthProvider.credential(
//   //       accessToken,
//   //     );
//   //   }
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         return result.accessToken;
//       } else {
//         print("Facebook Sign-In Failed: ${result.message}");
//         return null;
//       }
//
// } catch (error) {
//       print("Error during Facebook Sign-In: $error");
//       return null;
//     }
//   }
//
//   Future<void> signOutWithFacebook() async {
//     await FacebookAuth.instance.logOut();
//   }
}
