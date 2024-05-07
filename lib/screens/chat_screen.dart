import 'package:api/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: true);
    return user.searchedList == null
        ? const Center(child: CircularProgressIndicator())
        : Consumer<UserProvider>(
            builder: (context, value, child) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Conversations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('Add New'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          user.searchFunction(value);
                        },
                        decoration: InputDecoration(
                            hintText: 'search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemCount: user.searchedList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            children: [
                              const CircleAvatar(
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
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    user.searchedList![index].company.bs,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
