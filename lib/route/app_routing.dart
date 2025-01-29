import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/views.dart';

class appRouting {
  static final GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: 'Inithome',
      builder: (context, state) => InitHome(),
    ),
    GoRoute(
      path: '/Add_Script/teleprompt_screen/Create_Edit_Screen',
      name: 'Create_Edit_Screen',
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: Create_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/Add_Script/teleprompt_screen/Edit_Screen',
      name: 'Edit_Screen',
      pageBuilder: (context, state) {
        final id = state.uri.queryParameters['id'] ?? 'Default id';
        final title = state.uri.queryParameters['title'] ?? 'Default Title';
        final content =
            state.uri.queryParameters['content'] ?? 'Default Content';
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: EditScreen(
            initialContent: content,
            initialTitle: title,
            scriptId: id,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/Add_Script/teleprompt_screen/SmartCueScreen',
      name: 'SmartCueScreen',
      builder: (context, state) {
        final id = state.uri.queryParameters['id'] ?? 'Default id';
        final title = state.uri.queryParameters['title'] ?? 'Default Title';
        final content =
            state.uri.queryParameters['content'] ?? 'Default Content';

        return SmartCueScreen(
          title: title,
          content: content,
          id: id,
        );
      },
    ),
  ]);
}
