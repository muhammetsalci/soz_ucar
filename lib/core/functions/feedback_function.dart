import 'package:flutter/material.dart';

import '../../features/home/widgets/feed_back_widget.dart';

void feedbackDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Geri Bildirim'),
        content: FeedbackForm(),
      );
    },
  );
}
