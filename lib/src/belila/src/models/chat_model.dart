
import 'package:ultimate_bundle/src/belila/src/models/chat_message_model.dart';

class ChatModel {
  ChatModel({
    this.id,
    this.sender,
    this.receiver,
    this.product,
    this.message,
  });

  int? id;
  _Receiver? sender;
  _Receiver? receiver;
  _ProductModel? product;
  List<ChatMessageModel>? message;
}



class _ProductModel {
  _ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
  });

  int? id;
  String? name;
  int? price;
  List<String>? image;
}

class _Receiver {
  _Receiver({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;
}

ChatModel mockChat = ChatModel(
  id: 1,
  product: _ProductModel(
    id: 1,
    name: 'Nike Air Zoom Pegasus 38',
    price: 12000000,
    image: [
      'https://i.pinimg.com/564x/4f/21/eb/4f21eb38058aada1f433671b20658d19.jpg',
      'https://i.pinimg.com/564x/6d/fb/4c/6dfb4c70e7054967f151d3e11212fb9b.jpg',
    ],
  ),
  receiver: _Receiver(
    id: 1,
    name: 'Nike Store',
    image: 'https://i.pinimg.com/564x/ba/ad/62/baad62f02fb9fbed9381c39da6fe1d1a.jpg',
  ),
  sender: _Receiver(
    id: 3,
    name: 'Sergio A Riley',
    image: 'https://i.pinimg.com/564x/28/9d/01/289d011c876690f5880746aed66b2a63.jpg',
  ),
  message: [
    ChatMessageModel(
      id: 1,
      body: 'Hi, your product ready to order?',
      sender: 'customer',
      isImage: false,
      createdAt: DateTime.parse('2021-09-25 09:49:22'),
    ),
    ChatMessageModel(
      id: 2,
      body: 'Yes, ready to order. go ahead',
      sender: 'seller',
      isImage: false,
      createdAt: DateTime.parse('2021-09-25 09:49:22'),
    ),
    ChatMessageModel(
      id: 3,
      body: 'Alright, please packaging fast bro',
      sender: 'customer',
      isImage: false,
      createdAt: DateTime.parse('2021-09-25 09:49:22'),
    ),
  ]
);
