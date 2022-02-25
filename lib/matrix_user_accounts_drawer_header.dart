import 'package:flutter/material.dart';

class MatrixUserAccountsDrawerHeader extends StatelessWidget {
  final String accountName;
  final String matrixId;

  const MatrixUserAccountsDrawerHeader(
      {Key? key, required this.accountName, required this.matrixId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => UserAccountsDrawerHeader(
        accountName: Text(accountName),
        accountEmail: Text(matrixId),
        currentAccountPicture: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        onDetailsPressed: () =>
            Navigator.of(context).pushNamed("/accountSettings"),
        arrowColor: Colors.transparent,
      );
}
