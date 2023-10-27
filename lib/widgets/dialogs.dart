import 'package:flutter/material.dart';
import 'package:sayfood/widgets/primary_button.dart';

showInfoDialog(
  BuildContext context,
  String? message,
) {
  return showDialog(
      context: context,
      builder: (context) => Material(
            color: Colors.transparent,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 16, right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              // Lottie.asset(icon, height: 150, repeat: true),
                              const SizedBox(height: 8),
                              const Center(
                                child: Text(
                                  'INFO',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  message!,
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: 130,
                                child: PrimaryButton(
                                  text: 'Dismiss',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
}
