import 'package:coffeapi/CoffeApi/coffeapi.dart';
import 'package:flutter/material.dart';

class Coffeall extends StatefulWidget {
  const Coffeall({super.key, Key});

  @override
  _CoffeallState createState() => _CoffeallState();
}

class _CoffeallState extends State<Coffeall> {
  List<dynamic> _coffe = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getCoffe();
  }

  Future<void> _getCoffe() async {
    try {
      final coffe = await CafeApi.getCoffe();
      setState(() {
        _coffe = coffe;
      });
    } catch (e) {
      // Error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 238, 227),
      appBar: AppBar(
        title: const Text(
          'Lista de Cafés',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 136, 90, 58),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 136, 90, 58),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/taza.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _coffe.map((coffe) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: const Color.fromARGB(255, 201, 176, 154),
                    margin: const EdgeInsets.all(16.0),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Cafe ${coffe['nombrecafe']}',
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            'assets/coffe.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descripcion: ${coffe['descripcion']}',
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              Text('Tipo: ${coffe['tipocafe']}'),
                              Text('Intensidad: ${coffe['intensidad']}'),
                              Text('Stock: ${coffe['stock']}'),
                              Text('Precio: ${coffe['precio']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes agregar la lógica para agregar nuevos elementos
          // Por ejemplo, puedes abrir un nuevo formulario para ingresar los detalles del nuevo café.
        },
        backgroundColor: const Color.fromARGB(255, 136, 90, 58),
        child: const Icon(Icons.add),
      ),
    );
  }
}
