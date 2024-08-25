import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_test/config/router/routes.dart';
import 'package:todo_list_test/core/validator/validator.dart';
import 'package:todo_list_test/core/widgets/input_field_widget.dart';
import 'package:todo_list_test/core/widgets/loading_widget.dart';
import 'package:todo_list_test/core/widgets/primary_button.dart';
import 'package:todo_list_test/core/widgets/snackbar.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/features/auth/bloc/auth_bloc.dart';
import 'package:todo_list_test/features/auth/data/models/user_data.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  String? countryCode = "234";

  String? fullName = '';
  String? email = '';
  String? password = '';
  String? confirmPassword = "";
  bool acceptTerms = false;
  UserData? user;
  bool formIsValid = false;

  late GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();
  late GlobalKey<FormFieldState> confirmPasswordKey;
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> phoneNumKey;
  late GlobalKey<FormFieldState> fullNameKey;

  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();
    phoneNumKey = GlobalKey<FormFieldState>();
    fullNameKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Transform.translate(
          offset: const Offset(15, 0),
          child: Transform.scale(
            scale: 0.7,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "Set up your account",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20)
                          .copyWith(top: 0),
                  child: TextWidget(
                      textAlign: TextAlign.center,
                      color: Theme.of(context).colorScheme.secondary,
                      text:
                          "Please complete all information to create your account on todo_list_test."),
                ),
                InputFieldWidget(
                    hintColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: "User name",
                    hintSize: 12,
                    key: fullNameKey,
                    validator: (val) {
                      return Validator.validateText(val, "Full name");
                    },
                    enabledBorderRadius: 10,
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                      });
                    }),
                InputFieldWidget(
                    hintSize: 12,
                    hintColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: "Email Address",
                    key: emailKey,
                    enabledBorderRadius: 10,
                    validator: (val) {
                      return Validator.validateEmail(
                        val,
                      );
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    }),
                InputFieldWidget(
                    hintColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText: "Password",
                    obscureText: !obscureText,
                    hintSize: 12,
                    key: passwordKey,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        size: 17,
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    enabledBorderRadius: 10,
                    validator: (val) {
                      final passwordIsValid = Validator.validatePassword(val);
                      return passwordIsValid;
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                        passwordKey.currentState?.validate();
                      });
                    }),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                          value: acceptTerms,
                          // activeColor: Theme.of(context).colorScheme.secondary,
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                          onChanged: (val) {
                            setState(() {
                              acceptTerms = val ?? false;
                            });
                          }),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'I Agree to the ',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: "satoshi",
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "satoshi",
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: "satoshi",
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "satoshi",
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthStateError) {
                      InfoSnackBar.showErrorSnackBar(
                          context, state.error.errorMessage);
                    }
                    if (state is AuthStateUserIsRegistered) {
                      Navigator.of(context).pushReplacementNamed(
                          Routes.todoList,
                          arguments: state.user);
                    }
                  },
                  builder: (context, state) {
                    return state is AuthStateIsLoading
                        ? const LoadingWidget()
                        : PrimaryButton(
                            label: "Continue",
                            onPressed: () {
                              user = UserData(
                                password: password ?? "",
                                email: email ?? "",
                                userName: fullName ?? "",
                              );

                              if (!acceptTerms) {
                                InfoSnackBar.showErrorSnackBar(context,
                                    "You have to accept the Terms of Use and Privacy Policy to proceed.");
                              }
                              final bool isValid =
                                  formKey.currentState?.validate() ?? false;
                              if (isValid && acceptTerms) {
                                context.read<AuthBloc>().add(
                                    AuthEventRegisterUser(userData: user!));
                              }
                            },
                            isEnabled: true);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatPhoneNumber(String number, String countryCode) {
  return "+$countryCode-${number.substring(1, 4)}-${number.substring(4, 7)}-${number.substring(7, number.length)}";
}
