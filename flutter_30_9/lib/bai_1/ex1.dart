import 'package:flutter/material.dart';

class UserInforWidget extends StatelessWidget{
  final String username;
  final String email;

  const UserInforWidget({
    super.key,
    required this.username,
    required this.email
});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Username: $username',
        style: const TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        Text('Email: $email',
          style: const TextStyle(fontSize: 20),)
      ],
    );
  }
}

class UserProfileScreen extends StatelessWidget{
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User information:"),
      ),
      body: const Center(
        child: UserInforWidget(
            username: "Phan Huynh Anh Tuan",
            email: 'tylertuan03@gmail.com'),
      ),
    );

  }
}