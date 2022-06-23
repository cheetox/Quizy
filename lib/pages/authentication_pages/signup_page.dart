import 'package:flutter/material.dart';
import 'package:quizlen/components/decoration.dart';
import 'package:quizlen/constants/color_constants.dart';
import 'package:quizlen/extension/context_extension.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationProperties.backgroundDecoration,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicHeight(0.05)),
        child: Column(
          children: [
            const Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 50,
              child: Image.asset("assets/images/logo.png"),
            ),
            const Spacer(
              flex: 15,
            ),
            Flexible(
              flex: 15,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstants.deepPurple, width: 2.5),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Kullanıcı adınızı giriniz",
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Flexible(
              flex: 15,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstants.deepPurple, width: 2.5),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "E-mail giriniz",
                    prefixIcon: const Icon(Icons.email)),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Flexible(
              flex: 15,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.deepPurple, width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  labelText: "Şifre giriniz",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Flexible(
              flex: 20,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorConstants.logoRed),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Kayıt Ol ",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Flexible(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Spacer(
                    flex: 22,
                  ),
                  Icon(
                    Icons.mail,
                    size: 50,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Icon(
                    Icons.mail,
                    size: 50,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Icon(
                    Icons.mail,
                    size: 50,
                  ),
                  Spacer(
                    flex: 22,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            const Flexible(
              flex: 5,
              child: Divider(
                height: 30,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hesabınız var mı?",
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: ColorConstants.logoRed),
                      ))
                ],
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
