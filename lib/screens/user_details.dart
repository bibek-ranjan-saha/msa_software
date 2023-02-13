import 'package:flutter/material.dart';
import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
  static const routeName = "/details";
  final Users user;

  const UserDetails(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("about user ${user.username ?? ""}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Full Name :  ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Text(
                    user.name ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "user-name :  ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Text(
                    user.username ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "company name :  ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Text(
                    user.company?.name ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "company bs :  ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Text(
                    user.company?.bs ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "company catch phrase :  ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Text(
                    user.company?.catchPhrase ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.phone),
                  onPressed: () async {
                    Uri uri = Uri.parse("tel://${user.phone}");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    } else {
                      if (context.mounted) {
                        showSnackBar(
                            context: context, text: "unable to open phone app");
                      }
                    }
                  },
                  label: const Text("phone no : "),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    user.phone ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.alternate_email_rounded),
                  onPressed: () async {
                    Uri uri = Uri.parse(
                        "mailto:${user.email}?subject=Greetings&body=Hi%20${user.name},"
                            "\nHappy%20New%20Year"
                            "\n\nCreated%20and%20shared%20from%20sample%20task"
                            "%20byMSA-Software\n"
                            "\nThanks%20and%20regards,"
                            "\nBibek%20ranjan%20saha");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    } else {
                      if (context.mounted) {
                        showSnackBar(
                            context: context, text: "unable to open mail");
                      }
                    }
                  },
                  label: const Text("email : "),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    user.email ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.web_rounded),
                  onPressed: () async {
                    Uri uri = Uri.http("${user.website}");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    } else {
                      if (context.mounted) {
                        showSnackBar(
                            context: context, text: "unable to open url");
                      }
                    }
                  },
                  label: const Text("website : "),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    user.website ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.location_on_rounded),
                  label: const Text("view on map"),
                  onPressed: () async {
                    String googleUrl = 'https://www.google'
                        '.com/maps/search/?api=1&query=${user.address?.geo?.lat},${user.address?.geo?.lat}';
                    Uri uri = Uri.parse(googleUrl);
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    } else {
                      if (context.mounted) {
                        showSnackBar(
                            context: context, text: "unable to open google "
                            "maps");
                      }
                    }
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "City : ${user.address?.city}\nStreet : ${user.address?.street}\nSuite : ${user.address?.suite}\nZip : ${user.address?.zipcode} ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
