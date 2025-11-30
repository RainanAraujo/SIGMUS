import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sigmus/generated/sigmus_api.models.swagger.dart';
import 'package:sigmus/services/sigmus_api.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/widgets/login_dialog.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _AppHeaderState extends State<AppHeader> {
  late final StreamSubscription<InternetStatus> _subscription;
  ValueNotifier<bool> isOnline = ValueNotifier<bool>(false);

  Future<void> _handleLogin(String email, String password) async {
    final res = await sigmusApi.entrarPost(
      body: HandlersPostEntrarReq(email: email, senha: password),
    );
    if (res.isSuccessful && res.body != null) {
      sigmusApi.setToken(res.body?.token);
    }
  }

  Future<void> _handleLogout() async {
    sigmusApi.setToken(null);
  }

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      isOnline.value = status == InternetStatus.connected;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/sigmus.svg',
            semanticsLabel: 'SIGMUS Logo',
            width: 110,
            height: 28,
          ),
          AnimatedBuilder(
            animation: Listenable.merge([
              sigmusApi.token,
              sigmusApi.userData,
              isOnline,
            ]),
            builder: (context, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildStatusBadge(isOnline: isOnline.value),
                  const SizedBox(width: 12),
                  buildAuthButton(
                    context: context,
                    isLoggedIn: sigmusApi.userData.value != null,
                    userName: sigmusApi.userData.value?.nome,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildStatusBadge({required bool isOnline}) {
    final Color badgeColor = isOnline
        ? const Color(0xFF16A34A)
        : AppColors.destructive;
    final Color badgeBgColor = isOnline
        ? const Color(0xFF16A34A).withOpacity(0.1)
        : AppColors.destructive.withOpacity(0.1);
    final Color badgeBorderColor = isOnline
        ? const Color(0xFF16A34A).withOpacity(0.2)
        : AppColors.destructive.withOpacity(0.2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: badgeBgColor,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: badgeBorderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
              boxShadow: isOnline
                  ? [
                      BoxShadow(
                        color: badgeColor.withOpacity(0.4),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isOnline ? 'Online' : 'Offline',
            style: TextStyle(
              color: badgeColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.01,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAuthButton({
    required BuildContext context,
    required bool isLoggedIn,
    String? userName,
  }) {
    if (isLoggedIn) {
      return PopupMenuButton<String>(
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.border),
        ),
        color: AppColors.popover,
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: _handleLogout,
            value: 'logout',
            child: Row(
              children: const [
                Icon(Icons.logout, size: 18, color: AppColors.foreground),
                SizedBox(width: 8),
                Text('Sair'),
              ],
            ),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.muted,
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.person_outline,
                size: 18,
                color: AppColors.foreground,
              ),
              const SizedBox(width: 6),
              Text(
                userName ?? 'Usuário',
                style: const TextStyle(
                  color: AppColors.foreground,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: AppColors.mutedForeground,
              ),
            ],
          ),
        ),
      );
    } else {
      return TextButton.icon(
        onPressed: () => LoginDialog.show(context, onLogin: _handleLogin),
        icon: const Icon(Icons.login, size: 18),
        label: const Text('Entrar'),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.foreground,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.border),
          ),
        ),
      );
    }
  }
}
