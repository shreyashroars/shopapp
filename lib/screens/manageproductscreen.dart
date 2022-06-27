import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editscreen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _pricefocusnode = FocusNode();
  final _descripfocusnode = FocusNode();
  final _imageURLController = TextEditingController();
  final _imagefocusnode = FocusNode();
  @override
  void initState() {
    _imagefocusnode.addListener(_updateImageURL);

    super.initState();
  }

  void _updateImageURL() {
    if (!_imagefocusnode.hasFocus) setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _imagefocusnode.removeListener(_updateImageURL);
    _pricefocusnode.dispose();
    _descripfocusnode.dispose();
    _imageURLController.dispose();
    _imagefocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Title')),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_pricefocusnode);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Price')),
              textInputAction: TextInputAction.next,
              focusNode: _pricefocusnode,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descripfocusnode);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Description')),
              maxLines: 3,
              // focusNode: _pricefocusnode,
              keyboardType: TextInputType.multiline,
              focusNode: _descripfocusnode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: _imageURLController.text.isEmpty
                      ? const Text('Enter URL')
                      : FittedBox(
                          child: Image.network(_imageURLController.text),
                          fit: BoxFit.fill),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text('ImageURL')),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageURLController,
                    focusNode: _imagefocusnode,
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
