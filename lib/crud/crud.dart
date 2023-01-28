import 'package:flutter/material.dart';
import 'package:e_katalog/crud/model.dart';
import 'package:e_katalog/crud/repository.dart';

class MyCRUD extends StatefulWidget {
  const MyCRUD({super.key, required this.title});

  final String title;

  @override
  State<MyCRUD> createState() => _MyCRUDState();
}

class _MyCRUDState extends State<MyCRUD> {
  List<Produk> listProduk = [];
  Repository repository = Repository();

  getData() async {
    listProduk = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.book,
                  color: Colors.lightBlue,
                  size: 30,
                  ),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
              );
            },
          ),
          centerTitle: true,
          elevation: 3,
          backgroundColor: Colors.white,
          title: const Text(
            'CRUD Produk',
            style: TextStyle(
              color: Colors.lightBlue, 
              fontWeight: FontWeight.bold,
              fontSize: 25
              ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, "/create");
                   }),
                    icon: const Icon(
                    Icons.add_circle_outline_sharp,
                    size: 30,
                    color: Colors.lightBlue,
                  ),
                )
              ]
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listProduk.length,
          itemBuilder: (context , index){
            return Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.0, 
                          color: Colors.lightBlue
                        ),
                      ),
                    ),
                    // child: const Icon(Icons.autorenew, color: Colors.white,),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(listProduk[index].gambar.toString())
                    )
                  ),
                  title: Text(
                    listProduk[index].nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                      fontSize: 20
                    ),
                  ),                  
                  trailing: SizedBox(
                    // Icons.arrow_forward_ios_rounded, 
                    // color: Colors.lightBlue, 
                    // size: 30.0,
                    width: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            // ignore: unused_local_variable
                            bool response = await repository
                            .deleteData(listProduk[index].id);
                            return getData();
                          }, 
                          icon: const Icon(Icons.delete_rounded, color: Colors.red,)
                        )
                      ]
                    ),
                  ),
                  onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/update",
                        arguments: [
                          listProduk[index].id,
                          listProduk[index].nama,
                          listProduk[index].harga,
                          listProduk[index].deskripsi,
                          listProduk[index].gambar,
                        ]
                      );
                    },
                ),
              ),
            );
          },
        )
      ),
    );
  }
}