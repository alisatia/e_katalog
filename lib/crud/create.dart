import 'package:flutter/material.dart';
import 'package:e_katalog/crud/repository.dart';

class CreateProduk extends StatefulWidget {
  const CreateProduk({super.key});

  @override
  State<CreateProduk> createState() => _CreateProdukState();
}

class _CreateProdukState extends State<CreateProduk> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _gambarController = TextEditingController();

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
            'Create Produk',
            style: TextStyle(
              color: Colors.lightBlue, 
              fontWeight: FontWeight.bold,
              fontSize: 25
              ),
          ),
        ),
      ),
        // ignore: avoid_unnecessary_containers
        // body: Container( 
        //   child: Column(
        //     children: [
        //       TextField(
        //         controller: _namaController,
        //         decoration: const InputDecoration(hintText: 'nama'),
        //       ),
        //       TextField(
        //         controller: _hargaController,
        //         decoration: const InputDecoration(hintText: 'harga'),
        //       ),
        //       TextField(
        //         controller: _deskripsiController,
        //         decoration: const InputDecoration(hintText: 'deskripsi'),
        //       ),
        //       TextField(
        //         controller: _gambarController,
        //         decoration: const InputDecoration(hintText: 'gambar'),
        //       ),
        //       ElevatedButton(
        //         onPressed: () async {
        //           bool response = await repository.postData(
        //             _namaController.text, 
        //             _hargaController.text,
        //             _deskripsiController.text,
        //             _gambarController.text
        //           );
        //           if (response) {
        //             // ignore: use_build_context_synchronously
        //             Navigator.pushNamed(context, "/crud");
        //           } else {
        //             debugPrint('Input Data Gagal');
        //           }
        //         },
        //         child: const Text("Submit")
        //       ),              
        //     ]
        //   )          
        // )
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
                  bool response = await repository.postData(
                    _namaController.text, 
                    _hargaController.text,
                    _deskripsiController.text,
                    _gambarController.text
                  );
                  if (response) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, "/crud");
                  } else {
                    debugPrint('Input Data Gagal');
                  }
                },
                child: const Text("Create")
              ),
            ],
          ),
        ),
      ),
    );
  }
}