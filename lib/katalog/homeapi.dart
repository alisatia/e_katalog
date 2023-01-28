import 'package:flutter/material.dart';
import 'package:e_katalog/katalog/apimodel.dart';
import 'package:e_katalog/katalog/apirepo.dart';

class HomePageApi extends StatefulWidget {
  const HomePageApi({super.key, required this.title});

  final String title;

  @override
  State<HomePageApi> createState() => _HomePageApiState();
}

class _HomePageApiState extends State<HomePageApi> {
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
                  Icons.settings,
                  color: Colors.lightBlue,
                  size: 30,
                  ),
                onPressed: () {
                  Navigator.pushNamed(context, "/crud");
                },
              );
            },
          ),
          centerTitle: true,
          elevation: 3,
          backgroundColor: Colors.white,
          title: const Text(
            'Katalog',
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
                    Navigator.pushNamed(context, "/home");
                   }),
                    icon: const Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, "/user");
                   }),
                    icon: const Icon(
                    Icons.account_circle,
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
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ), 
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 3,
                shadowColor: Colors.grey,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(listProduk[index].gambar.toString()),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      listProduk[index].nama,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Rp ${listProduk[index].harga}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    
                  ]
                )
              )
            );
          },
          itemCount: listProduk.length,
        ),
      ),
    );
  }
}