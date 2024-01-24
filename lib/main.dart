import 'package:flutter/material.dart';
import 'package:singleton_pattern/features/number_generator_singleton/presentation/sequence_page.dart';
import 'features/file_manager_singleton/presentation/screens/log_message_page.dart';
import 'features/file_manager_singleton/presentation/screens/show_audit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Log Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "File1"),
                Tab(text: "File2"),
                Tab(text: "File3"),
                Tab(text: "Show Audit File"),
                Tab(text: "Number1"),
                Tab(text: "Number2"),
                Tab(text: "Number3"),
              ],
            ),
            title: const Text('File Audit Manager'),
          ),
          body: const TabBarView(
            children: [
              LogMessagePage(),
              LogMessagePage(),
              LogMessagePage(),
              ShowAuditFilePage(),
              SequencePage(),
              SequencePage(),
              SequencePage(),
            ],
          ),
        ),
      ),
    );
  }
}
