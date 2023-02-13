import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msa_software/blocs/users/users_bloc.dart';
import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/widgets/user_card.dart';

import '../widgets/theme_view.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersBloc _usersBloc = UsersBloc();

  @override
  void initState() {
    _usersBloc.add(GetUsersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Test submitted by Bibek"),
        actions: const [
          ThemeView(),
        ],
      ),
      body: BlocProvider(
        create: (_) => _usersBloc,
        child: BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state is UsersError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("fuck off")));
            }
          },
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case UsersInitial:
                case UsersLoading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case UsersError:
                  return Center(
                    child: Text(
                      "something went wrong",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                case UsersLoaded:
                  List<Users> users = (state as UsersLoaded).users;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        user: users[index],
                      );
                    },
                  );
                default:
                  return Center(
                    child: Text(
                      "We are working on it",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
