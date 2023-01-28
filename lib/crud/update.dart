import 'package:flutter/material.dart';
import 'package:e_katalog/crud/repository.dart';

class UpdateProduk extends StatefulWidget {
  const UpdateProduk({super.key});

  @override
  State<UpdateProduk> createState() => _UpdateProdukState();
}

class _UpdateProdukState extends State<UpdateProduk> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _gambarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      _namaController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      _hargaController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      _deskripsiController.text = args[3];
    }
    if (args[4].isNotEmpty) {
      _gambarController.text = args[4];
    }
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
            'Update Produk',
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
      backgroundColor: Colors.grey[300],
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.book, color: Colors.lightBlue,),
                  labelText: "Nama Produk",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.attach_money_rounded, color: Colors.lightBlue,),
                  labelText: "Harga",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description_rounded, color: Colors.lightBlue,),
                  labelText: "Deskripsi",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _gambarController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.image_rounded, color: Colors.lightBlue,),
                  labelText: "Gambar",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  bool response = await repository.putData(int.parse(args[0]),
                    _namaController.text, 
                    _hargaController.text,
                    _deskripsiController.text,
                    _gambarController.text
                  );
                  if (response) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, "/crud");
                  } else {
                    debugPrint('Update Data Gagal');
                  }
                },
                child: const Text("Update")
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),     
    );
  }
}