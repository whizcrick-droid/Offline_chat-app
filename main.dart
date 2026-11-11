import 'package:flutter/material.dart';
import 'controllers/chat_controller.dart';
import 'core/theme.dart';
import 'models/models.dart';
import 'screens/chat_list_screen.dart';
import 'services/connectivity_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OfflineChatApp());
}

class OfflineChatApp extends StatefulWidget {
  const OfflineChatApp({super.key});
  @override
  State<OfflineChatApp> createState() => _OfflineChatAppState();
}

class _OfflineChatAppState extends State<OfflineChatApp> {
  // Replace with a user-entered name (persist it with shared_preferences).
  late final ChatController _controller = ChatController(
    ConnectivityService(userName: 'User-${randomId(3).toUpperCase()}'),
  );

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Chat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(Brightness.light),
      darkTheme: AppTheme.build(Brightness.dark),
      home: ChatListScreen(controller: _controller),
    );
  }
}
