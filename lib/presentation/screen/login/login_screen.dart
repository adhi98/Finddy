import 'package:finddy/gen/assets.gen.dart';
import 'package:finddy/presentation/navigation/app_routes.dart';
import 'package:finddy/presentation/screen/widget/finddy_button.dart';
import 'package:finddy/presentation/screen/widget/finddy_textfield.dart';
import 'package:finddy/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:finddy/presentation/screen/widget/finddy_text.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    //hide statusbar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  bool textfieldPw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff0000000d).withOpacity(0.05),
                          blurRadius: 1,
                          offset: const Offset(2, 3))
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    Assets.images.imgFindyLogo.path,
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const FDText.headersH3(
                text: "Selamat datang kembali!",
                color: AppColors.neutralBlack80,
              ),
              const SizedBox(height: 12),
              const FDText.bodyP3(
                text: "Mulai temukan teman belajarmu di sini!",
                color: AppColors.neutralBlack60,
              ),
              const SizedBox(height: 78),
              const FDText.headersH6(
                text: "Email",
                color: AppColors.neutralBlack60,
              ),
              const SizedBox(height: 12),
              FDTextField.normal(
                hintText: "Masukan email kamu",
                textEditingController: _emailController,
                onChanged: (data) {
                  print("dataEmail : $data");
                },
              ),
              const SizedBox(height: 24),
              const FDText.headersH6(
                text: "Password",
                color: AppColors.neutralBlack60,
              ),
              const SizedBox(height: 12),
              FDTextField.password(
                hintText: "Masukkan kata sandi kamu",
                textEditingController: _passwordController,
                onChanged: (data) {
                  print("dataPassword : $data");
                },
                icon: textfieldPw
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                isVisible: textfieldPw,
                onPressed: () {
                  setState(() {
                    textfieldPw = !textfieldPw;
                  });
                },
              ),
              const SizedBox(height: 40),
              FDButton.primary(
                  onPressed: () {
                    // context.pushNamed(AppRoutes.nrRegister);
                  },
                  text: "Login"),
              const SizedBox(height: 60),
              const Center(
                child: FDText.bodyP3(
                  text: "Belum punya akun?",
                  color: AppColors.neutralBlack60,
                ),
              ),
              const SizedBox(height: 12),
              FDButton.secondary(
                  onPressed: () {
                    context.pushNamed(AppRoutes.nrRegister);
                  },
                  text: "Registrasi Sekarang")
            ],
          ),
        ),
      ),
    );
  }
}
