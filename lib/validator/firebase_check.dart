import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUpdateStatusScreen extends StatefulWidget {
  final String id;

  const FirebaseUpdateStatusScreen({super.key, required this.id});

  @override
  State<FirebaseUpdateStatusScreen> createState() =>
      _FirebaseUpdateStatusScreenState();
}

class _FirebaseUpdateStatusScreenState
    extends State<FirebaseUpdateStatusScreen> {
  bool? _success;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      await FirebaseFirestore.instance
          .collection('participants')
          .doc(widget.id)
          .update({'isAssistence': true});

      setState(() {
        _success = true;
      });

      // Esperar 3 segundos y volver al home
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      setState(() {
        _success = false;
      });

      // También volver al home tras mostrar el fallo
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_success == null) {
      content = const CircularProgressIndicator();
    } else if (_success == true) {
      content = const Icon(Icons.check_circle, color: Colors.green, size: 150);
    } else {
      content = const Icon(Icons.cancel, color: Colors.red, size: 150);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Validación')),
      body: Center(child: content),
    );
  }
}
