import 'package:boilerplate/constants/asset_strings.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class IndexAppbar extends StatelessWidget {
  const IndexAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.primary,
      leading: ModalRoute.of(context)!.canPop
          ? IconButton(
              icon: Icon(Directionality.of(context) == TextDirection.rtl ? Icons.chevron_right_outlined : Icons.chevron_left_outlined),
              color: Colors.white,
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () => Navigator.maybePop(context),
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppAssets.loginBackground, fit: BoxFit.cover),
            Center(
              child: Image.asset(AppAssets.arabic, width: 200, height: 200),
            ),
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                height: 33,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndexButton extends StatelessWidget {
  const IndexButton({super.key, required this.onSubmit, required this.text, this.isLoading = false});

  final void Function()? onSubmit;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: AppColors.grey),
      onPressed: onSubmit,
      child: isLoading ? const ButtonLoader() : Text(text, style: const TextStyle(color: AppColors.darkerGrey)),
    );
  }
}

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15, width: 15, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
  }
}
