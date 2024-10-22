import 'package:boilerplate/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants/app_colors.dart';
import '../../../error/api_exception.dart';
import '../../../utils/alerts.dart';
import '../widgets/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildHeader(BuildContext context) {
    return Column(children: <Widget>[
      Center(child: Text('login', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900))),
      const SizedBox(height: 35),
    ]);
  }

  Widget _buildLinks(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      TextButton(
        child: const Text('forgotPassword'),
        onPressed: () => {},
      ),
      TextButton(
        child: const Text('registerNewAccount'),
        onPressed: () => {},
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            const IndexAppbar(),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      _buildHeader(context),
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        const LoginForm(),
                        _buildLinks(context),
                      ])
                    ])))
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  bool isLoading = false;
  String? usernameError;
  String? passwordError;

  @override
  void dispose() {
    passwordFocusNode.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSubmit() async {
    usernameError = null;
    passwordError = null;

    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        await Future.delayed(const Duration(milliseconds: 2000), () {});

        if (usernameController.text == '123' && passwordController.text == 'admin') {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.ordersScreen,
            (_) => false,
          );
        } else {
          throw Exception();
        }

        // await authController.login(usernameController.text, passwordController.text);
        // Get.offAllNamed(routes.home);
      } on ValidationException catch (e) {
        if (e.data != null) Alerts.showSnackBar(context, message: e.data.toString(), type: AlertType.ERROR);
        usernameError = e.data('username');
        passwordError = e.data('password');
      } on UpgradeRequiredException {
        // Do nothing - It is handled by API service client - thus there's no need to display any error messages here
      } catch (e) {
        Alerts.showSnackBar(context, message: "Error", type: AlertType.ERROR);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              onEditingComplete: () => passwordFocusNode.requestFocus(),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: '${'serviceNumber'}/${'phoneNumber'}',
                prefixIcon: const Icon(Icons.person_2_outlined),
                errorText: usernameError,
                counter: const SizedBox.shrink(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: usernameController,
              onChanged: (String value) {
                usernameError = null;
              },
              maxLength: 9,
              autocorrect: false,
              validator: (value) => (value == null || value.isEmpty) ? 'phoneNumberOrServiceNumberRequired' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: passwordFocusNode,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                onSubmit();
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'password',
                prefixIcon: const Icon(Icons.lock_outlined),
                errorText: passwordError,
              ),
              obscureText: true,
              controller: passwordController,
              onChanged: (String value) {
                passwordError = null;
              },
              validator: (value) => (value == null || value.isEmpty) ? 'passwordRequired' : null,
            ),
            const SizedBox(height: 10),
            IndexButton(text: 'login', isLoading: isLoading, onSubmit: isLoading ? null : onSubmit),
          ],
        ));
  }
}
