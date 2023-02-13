import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msa_software/blocs/users/users_bloc.dart';
import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/utils/app_utils.dart';
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
              String errorMsg = state.message ?? "something went wrong";
              showSnackBar(context: context, text: errorMsg);
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
                  String errorMsg =
                      (state as UsersError).message ?? "something went wrong";
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          errorMsg,
                          style: Theme.of(context).textTheme.titleMedium,
                        ).animate().scale(
                            begin: const Offset(5, 5), end: const Offset(1, 1)),
                        IconButton(
                          onPressed: () {
                            _usersBloc.add(GetUsersList());
                          },
                          icon: const Icon(Icons.refresh),
                        ).animate().shake()
                      ],
                    ),
                  );
                case UsersLoaded:
                  List<Users> users = (state as UsersLoaded).users;
                  return RefreshIndicator(
                    onRefresh: () async {
                      _usersBloc.add(UpdateUsersList());
                    },
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          user: users[index],
                        )
                            .animate()
                            .fadeIn(duration: 300.ms, delay: 100.ms)
                            .shimmer(color: Colors.grey)
                            .move(
                                begin: const Offset(-16, 0),
                                curve: Curves.easeOutQuad);
                      },
                    ),
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
