import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  //sağdaki butonları belirttiğimiz yer
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? null : query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }
  @override
  //soldaki butonları belirttiğimiz yer
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 24,
      ),
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
