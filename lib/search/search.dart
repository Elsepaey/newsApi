import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../news/dateUtils.dart';
import 'package:newsapi/api/api_manager.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool searched=false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(children: [
      SizedBox(
        height: screenHeight / 70,
      ),
      Row(
        children: [
          const SizedBox(
            width: 8,
          ),

          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },


              controller: _searchQueryController,
              decoration: const InputDecoration(
                hintText: 'Search News',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(

                fixedSize: const Size(100, 60),
                backgroundColor: const Color(0xFF66C649).withOpacity(0.7)),
              onPressed: () {
              if(_searchQueryController.text.trim().isNotEmpty)
                {
                  setState(() {
                    searched=true;
                  });
                }
             },
              child: const Center(
                  child: Text(
                "Go",

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22,color: Colors.black),
              ))),
          const SizedBox(
            width: 8,
          ),


        ],
      ),
      const SizedBox(
        height: 10,
      ),

      searched?
      Expanded(
        child: FutureBuilder<List<dynamic>>(
          future: apiManager.fetchSearchNews(_searchQueryController.text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.8),
                          child: CachedNetworkImage(
                            height: 230,width: double.infinity,fit: BoxFit.cover,
                            imageUrl:snapshot.data![index]['urlToImage'],
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),


                        Text(snapshot.data![index]['author']??"",style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),),
                        Text(snapshot.data![index]['title']??"",style: const TextStyle(color: Color(0xFF42505C),fontSize: 18,fontWeight: FontWeight.w500),),
                        Text( MyDateUtils.FormatNewsDate(snapshot.data![index]['publishedAt']??""),style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),textAlign: TextAlign.end,)

                      ],);


                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
        
            // By default, show a loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
      :
      Expanded(
        child: FutureBuilder<List<dynamic>>(
          future: apiManager.fetchGeneralNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return
                    Card(
                      color:  Colors.white,
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(0.8),
                          //   child: CachedNetworkImage(
                          //     height: 230,width: double.infinity,fit: BoxFit.cover,
                          //     imageUrl:snapshot.data![index]['urlToImage'],
                          //     placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          //     errorWidget: (context, url, error) => const Icon(Icons.error),
                          //   ),
                          // ),
                      
                      
                          Text(snapshot.data![index]['author']??"",style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),),
                          Text(snapshot.data![index]['title']??"",style: const TextStyle(color: Color(0xFF42505C),fontSize: 18,fontWeight: FontWeight.w500),),
                          Text( MyDateUtils.FormatNewsDate(snapshot.data![index]['publishedAt']??""),style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),textAlign: TextAlign.end,)
                      
                        ],),
                    );


                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }

            // By default, show a loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )


    ]);
  }
}
