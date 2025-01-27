import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/cubit/scroll_state.dart';

class ScrollHelper {
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;
  Timer? _scrollTimer;

  void startScrolling(BuildContext context, double index) {
    // Cancel any previous timer before starting a new one
    _scrollTimer?.cancel();

    if (_scrollController.hasClients) {
      _scrollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
        if (_scrollController.hasClients &&
            context.read<ScrollCubit>().state.isUserScrolling) {
          double currentOffset = _scrollController.offset;
          double maxScrollExtent = _scrollController.position.maxScrollExtent;

          if (currentOffset < maxScrollExtent) {
            _scrollController
                .jumpTo(currentOffset + index); // Adjust speed as needed
          } else {
            _scrollTimer?.cancel(); // Stop scrolling when at the end
          }
        } else {
          _scrollTimer?.cancel(); // Stop scrolling if the user stops it
        }
      });
    }
  }

  void stopScrolling() {
    // Cancel the timer to stop scrolling
    _scrollTimer?.cancel();
  }

  void dispose() {
    // Cancel the timer and dispose the scroll controller
    _scrollTimer?.cancel();
    _scrollController.dispose();
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';

// class ScrollHelper {
//   late final ScrollController scrollController;
//   Timer? scrollTimer;

//   ScrollHelper() {
//     scrollController = ScrollController();
//   }

//   void startScrolling(BuildContext context) {
//     scrollTimer?.cancel(); // Cancel any ongoing timer

//     if (scrollController.hasClients) {
//       scrollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
//         final currentOffset = scrollController.offset;
//         final maxScrollExtent = scrollController.position.maxScrollExtent;

//         if (currentOffset < maxScrollExtent) {
//           scrollController.jumpTo(currentOffset + 2); // Adjust speed here
//         } else {
//           stopScrolling();
//         }
//       });
//     }
//   }

//   void stopScrolling() {
//     scrollTimer?.cancel();
//   }

//   void dispose() {
//     scrollTimer?.cancel();
//     scrollController.dispose();
//   }
// }
