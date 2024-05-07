import 'package:api/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: true);
    return Container(
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/97/bb/06/97bb067e30ff6b89f4fbb7b9141025ca.jpg'),
            minRadius: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.searchedList![index].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                user.searchedList![index].company.bs,
                style: const TextStyle(color: Colors.black45),
              )
            ],
          )
        ],
      ),
    );
  }
}
