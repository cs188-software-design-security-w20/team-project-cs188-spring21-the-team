import 'package:flutter/material.dart';
import '../../constants/Palette.dart' as Palette;
import '../components/FollowerRequestTile.dart';
import '../components/FollowerTile.dart';

class FollowerTileList extends StatelessWidget {
  final List followerRequestList;
  final List followerList;

  List<dynamic> combinedFollowerList;

  FollowerTileList({this.followerRequestList, this.followerList}) {
    combinedFollowerList = followerRequestList + followerList;
  }

  @override
  Widget build(BuildContext context) {
    return this.followerRequestList.isEmpty
        ? Text(
            'You currently have no pending requests or followers:)') // default message if not following anyone
        : ListView.separated(
            itemCount: combinedFollowerList.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (context, index) {
              var userProfile = combinedFollowerList[index];
              return index < followerRequestList.length
                  ? FollowerRequestTile(
                      userProfile: userProfile,
                      color: Palette.yellow,
                    )
                  : FollowerTile(
                      followerProfile: userProfile,
                      color: Palette.blue,
                    );
            },
          );
  }
}
