import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soz_ucar/utils/colors.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.secondaryColor),
                  ),
                  labelText: 'İsim',
                  floatingLabelStyle: TextStyle(color: ColorItems.primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen isminizi girin';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.secondaryColor),
                  ),
                  labelText: 'E-posta',
                  floatingLabelStyle: TextStyle(color: ColorItems.primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen e-postanızı girin';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.secondaryColor),
                  ),
                  labelText: 'Mesaj',
                  floatingLabelStyle: TextStyle(color: ColorItems.primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorItems.primaryColor),
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen geri bildiriminizi girin';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorItems.primaryColor),
              child: const Text('Gönder'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String message1;
                  try {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final message = _messageController.text;
                    final date = DateTime.now().toIso8601String();
                    await FirebaseFirestore.instance
                        .collection('feedback')
                        .add({
                      'name': name,
                      'email': email,
                      'message': message,
                      'date': date,
                    });
                    message1 = 'Geri Bildiriminiz Başarıyla Gönderildi.';
                  } catch (e) {
                    message1 =
                        'Geri Bildiriminiz Gönderilirken Bir Hata Oluştu.';
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message1)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
