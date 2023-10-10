import 'package:cpf/src/controller/cpf_controller.dart';
import 'package:flutter/material.dart';

class CpfPage extends StatefulWidget {
  const CpfPage({super.key});

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  CpfController controller = CpfController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar CPF'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              onChanged: controller.setCpf,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o CPF',
                labelText: 'CPF',
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              controller.validaCPF(controller.cpf);
            },
            child: const Text('Validar'),
          ),
          const SizedBox(height: 10),
          Text(controller.result),
        ],
      ),
    );
  }
}
