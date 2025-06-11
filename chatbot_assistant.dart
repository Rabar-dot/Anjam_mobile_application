// File: lib/chatbot_assistant.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'models.dart';

class ChatbotAssistant extends StatefulWidget {
  const ChatbotAssistant({Key? key}) : super(key: key);

  @override
  State<ChatbotAssistant> createState() => _ChatbotAssistantState();
}

class _ChatbotAssistantState extends State<ChatbotAssistant> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addBotMessage(
        "Hello! I'm your Anjam Hospital assistant. How can I help you today?");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildMessagesList()),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.smart_toy, color: AppColors.primaryGreen),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Online now',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primaryGreen : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser ? Colors.white : AppColors.primaryText,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.lightGrey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: _sendMessage,
              icon: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
    });
    _messageController.clear();

    // Simulate bot response
    Future.delayed(const Duration(seconds: 1), () {
      _addBotMessage(_getBotResponse(text));
    });

    _scrollToBottom();
  }

  void _addBotMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: false));
    });
    _scrollToBottom();
  }

  String _getBotResponse(String userMessage) {
    final message = userMessage.toLowerCase();

    if (message.contains('appointment') || message.contains('book')) {
      return "I can help you book an appointment! You can use the 'Appointments' tab to schedule with any of our specialists. Would you like me to guide you through the process?";
    } else if (message.contains('result') || message.contains('test')) {
      return "You can view your test results in the 'Results' tab. Results are organized by date in a calendar view. Tap on any date to see available results and tap on a result to view the detailed report.";
    } else if (message.contains('doctor') || message.contains('specialist')) {
      return "We have specialists in Cardiology, Neurology, Orthopedics, Pediatrics, Ophthalmology, and ENT. You can browse doctors by specialty in the 'Health Categories' section on the home page.";
    } else if (message.contains('emergency') || message.contains('urgent')) {
      return "For emergencies, please call +964 750 123 4567 immediately or visit our Emergency Department at Anjam Central Hospital. This is available 24/7.";
    } else if (message.contains('card') || message.contains('digital')) {
      return "Your digital hospital card is available in the Profile tab. You can show this QR code at any Anjam Hospital for quick check-in.";
    } else if (message.contains('language')) {
      return "You can change the app language to English, Arabic, or Kurdish from the menu (☰) → 'Change Language'. The app will restart in your selected language.";
    } else if (message.contains('hello') || message.contains('hi')) {
      return "Hello! I'm here to help you with anything related to Anjam Hospital. You can ask me about appointments, test results, finding doctors, or general hospital information.";
    } else {
      return "I'm here to help with appointments, test results, finding doctors, emergency contacts, and general hospital information. What specific information do you need?";
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
