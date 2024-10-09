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
        backgroundColor: Color(0xFF006BFF),
        foregroundColor: Colors.white, // Warna foreground untuk AppBar
      ),
      body: Container(
        color: Color(0xFFBCF2F6), // Warna background
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (userProvider.userList.isEmpty) {
              return Center(child: Text('No Users Available'));
            }

            return ListView.separated(
              itemCount: userProvider.userList.length,
              itemBuilder: (context, index) {
                final user = userProvider.userList[index];
                return ListTile(
                  title: Center( // Membuat rata tengah
                    child: Text(
                      user.name,
                      style: TextStyle(color: Color(0xFF006BFF)), // Warna foreground
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      user.username,
                      style: TextStyle(color: Color(0xFF006BFF)), // Warna foreground
                    ),
                  ),
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
              separatorBuilder: (context, index) => Divider(
                color: Color(0xFF006BFF), // Garis antar list
                thickness: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
