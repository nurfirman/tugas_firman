import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_firman/bloc/auth/auth_cubit.dart';
import 'package:tugas_firman/bloc/auth/auth_state.dart';

class AbsensiFormPage extends StatefulWidget {
  
  final String? name;
  final String? status;
  
  const AbsensiFormPage({
    super.key,
    this.name,
    this.status,
    });

  @override
  State<AbsensiFormPage> createState() => _AbsensiFormPageState();
}

class _AbsensiFormPageState extends State<AbsensiFormPage> {

  final _nameController = TextEditingController();
  var typeAbsen = 'masuk';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.name ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Absensi Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
                BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  _nameController.text = state.user?.name ?? '';
                  return TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Karyawan',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  name';
                  }
                  return null;
                },
              );}),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: typeAbsen,
                    items: const [
                      DropdownMenuItem(
                        value: 'masuk',
                        child: Text('Absen Masuk'),
                      ),
                      DropdownMenuItem(
                        value: 'keluar',
                        child: Text('Absen Keluar'),
                      ),
                    ], 
                    onChanged: (value) {
                      if(value != null) {
                        typeAbsen = value;
                      }
                    }
                  ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: Text('Save'),
                  onPressed: () {
                    if(_formKey.currentState?.validate() ?? false) {
                      final name = _nameController.text;
                      String type = typeAbsen;
                      Navigator.pop(context, {'name': name, 'status':type });
                    }
                  }, 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}