import 'package:boilerplate/common/widgets/appbar.dart';
import 'package:boilerplate/constants/app_colors.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:boilerplate/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/app_strings.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom().copyWith(
                    elevation: const WidgetStatePropertyAll(4),
                    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                    minimumSize: const WidgetStatePropertyAll(
                      Size.fromHeight(80),
                    )),
                onPressed: () async {
                  final LocalStorage storage = LocalStorage();
                  await storage.write<bool>(AppStrings.onBoardingDone, true);
                  Navigator.pushReplacementNamed(context, AppRouter.home);
                },
                child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  TextButton(
                    onPressed: () {
                      controller.animateToPage(3, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                    },
                    child: const Text("SKIP"),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const WormEffect(
                        dotColor: AppColors.buttonDisabled,
                        activeDotColor: AppColors.primary,
                        dotHeight: 18,
                        dotWidth: 18,
                      ),
                      onDotClicked: (index) {
                        controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                    },
                    child: const Text("Next"),
                  ),
                ])),
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            controller: controller,
            children: [
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text("nigga 1"),
                ),
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text("nigga 2"),
                ),
              ),
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text("nigga 3"),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: const Center(
                  child: Text("nigga 4"),
                ),
              ),
            ],
          ),
        ));
  }
}
