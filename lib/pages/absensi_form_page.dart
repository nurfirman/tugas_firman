import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_firman/bloc/auth/auth_cubit.dart';
import 'package:tugas_firman/bloc/auth/auth_state.dart';
import 'package:location/location.dart';

class AbsensiFormPage extends StatefulWidget {
  
  final String? name;
  final String? status;
  final String? project;
  final String? tagGps;
  
  const AbsensiFormPage({
    super.key,
    this.name,
    this.status,
    this.project,
    this.tagGps,
    });

  @override
  State<AbsensiFormPage> createState() => _AbsensiFormPageState();
}



class _AbsensiFormPageState extends State<AbsensiFormPage> {
  String barcode = "";
  final _nameController = TextEditingController();
  final _projectController = TextEditingController();
  final _gpsController = TextEditingController();
  var typeAbsen = 'masuk';
  final Location location = Location();
  final _formKey = GlobalKey<FormState>();
  PermissionStatus? permissionGranted;
  LocationData? _location;

String? _error; 

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final locationResult = await location.getLocation();
      setState(() {
        _location = locationResult;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  @override
  void initState() {
    _nameController.text = widget.name ?? '';
    _projectController.text = widget.project ?? '';
    _gpsController.text = widget.tagGps ?? '';
   _checkPermissions();
   _requestPermission();
   _getLocation();
    super.initState();
  }

  Future<void> _checkPermissions() async {
    final permissionGrantedResult = await location.hasPermission();
    setState(() {
      permissionGranted = permissionGrantedResult;
    });
  }
Future<void> _requestPermission() async {
    if (permissionGranted != PermissionStatus.granted) {
      final permissionRequestedResult = await location.requestPermission();
      setState(() {
        permissionGranted = permissionRequestedResult;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _projectController.dispose();
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
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  name';
                  }
                  return null;
                },
              );}),
                       TextField(
            controller: _projectController,
            decoration: InputDecoration(
              labelText: 'Project Name',
              hintText: widget.name,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _projectController.clear();
                },
              ),
            ),
          ),
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
                      final project = _projectController.text;
                      final tagGps = '${_location?.latitude}, ${_location?.longitude}';
                      String type = typeAbsen;
                      Navigator.pop(context, {'name': name, 'status':type , 'project': project, 'tagGps': tagGps});
                    }
                  }, 
                ),
              ),
//               MobileScanner(
//   onDetect: (result) {
//     print(result.barcodes.first.rawValue);
//   },
// ),

            ],
          ),
        ),
      ),
    );
  }

}