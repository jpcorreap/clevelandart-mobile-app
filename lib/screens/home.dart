import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/widgets/artwork_searcher.dart';

import '../widgets/custom_button.dart';

class Home extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(user.email!),
            CustomButton(
              label: "Sign out",
              icon: const Icon(Icons.arrow_back, size: 32),
              onClick: FirebaseAuth.instance.signOut,
            ),
            const SizedBox(height: 10),
            ArtworkSearcher(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
}
