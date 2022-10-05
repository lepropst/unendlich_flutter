import 'package:flutter/material.dart';
import 'package:frontend/components/block_types.dart';
import 'package:frontend/database/models/block_model.dart';

class BlockView extends StatelessWidget {
  final Block block;
  BlockView({required this.block});
  @override
  Widget build(BuildContext context) {
    return blockTypes(block.type, block.value);
  }
}
