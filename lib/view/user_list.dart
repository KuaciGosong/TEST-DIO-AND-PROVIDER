import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../view/user_detail.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userProvider.userList.isEmpty) {
            return Center(child: Text('No Users Available'));
          }

          return ListView.builder(
            itemCount: userProvider.userList.length,
            itemBuilder: (context, index) {
              final user = userProvider.userList[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.username),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
