import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/screens/user_details.dart';

class UserCard extends StatelessWidget {
  final Users user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      tappable: true,
      middleColor: Colors.transparent,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (ctx,fun) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_box_rounded,
                      size: 50,
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      user.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Icon(Icons.email_rounded),
                    const SizedBox(width: 8,),
                    Text(
                      user.email ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Icon(Icons.phone_rounded),
                    const SizedBox(width: 8,),
                    Text(
                      user.phone ?? "",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.maps_home_work_rounded),
                    const SizedBox(width: 8,),
                    Text(
                      user.address?.city ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      openBuilder: (ctx,fun) => UserDetails(user),
    );
  }
}
