/*
 * cocktail_app
 * size_changing_app_bar
 * Created by Bahri Rizaldi on 04/06/2020 21:22
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:flutter/material.dart';

class SizeChangingAppBar extends StatelessWidget {
  final String title;
  final bool isListView;
  final VoidCallback onViewChanged;

  const SizeChangingAppBar(
      {Key key,
        this.title,
        this.isListView = true,
        this.onViewChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
//      expandedHeight: AppSizes.app_bar_expanded_size,
      floating: true,
      primary: true,
      snap: false,
      pinned: false,
      flexibleSpace: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title ?? 'Loading...',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 0),
                    onPressed: onViewChanged,
                    icon: Icon(
                      isListView ? Icons.view_list : Icons.view_module,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(),
      ),
    );
  }
}