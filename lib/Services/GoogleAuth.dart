import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Googleauth{

Future <UserCredential?> signinGoogle ()async{
 final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
if (gUser==null)return null;
final GoogleSignInAuthentication gAuth= await gUser.authentication;

final Credential = GoogleAuthProvider.credential(
  accessToken: gAuth.accessToken,
  idToken: gAuth.idToken
);

return await FirebaseAuth.instance.signInWithCredential(Credential);

}

}