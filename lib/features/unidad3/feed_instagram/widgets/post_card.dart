import 'package:flutter/material.dart';
import 'package:proyecto1_flutter_application/features/unidad3/feed_instagram/models/post.dart';

class PostCard extends StatefulWidget {
  final Post post; // Recibe el modelo por constructor

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // Estado INDEPENDIENTE
  bool _estaLikeado = false;
  int _contadorLikes = 0;

  void _darLike() {
    setState(() {
      _estaLikeado = !_estaLikeado;
      if (_estaLikeado) {
        _contadorLikes++;
      } else {
        _contadorLikes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              widget.post.usuario,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.network(
            widget.post.fotoUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                onPressed: _darLike,
                icon: Icon(
                  _estaLikeado ? Icons.favorite : Icons.favorite_border,
                  color: _estaLikeado ? Colors.red : Colors.grey,
                ),
              ),
              Text(
                '$_contadorLikes Me gusta',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(widget.post.descripcion),
          ),
        ],
      ),
    );
  }
}
