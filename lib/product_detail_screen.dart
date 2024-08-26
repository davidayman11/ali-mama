import 'package:flutter/material.dart';
import 'api_service.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  ProductDetailsScreen({required this.productId});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<Map<String, dynamic>> _productDetails;
  bool _isFavorite = false; // Track favorite status

  @override
  void initState() {
    super.initState();
    _productDetails = ApiService().fetchProductDetails(widget.productId);
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : theme.iconTheme.color,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }

          final product = snapshot.data!;
          final price = product['price'] ?? 'Price not available';
          final title = product['title'] ?? 'Title not available';
          final description = product['description'] ?? 'Description not available';
          final warranty = product['warrantyInformation'] ?? 'Not available';
          final shipping = product['shippingInformation'] ?? 'Not available';

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product['thumbnail']),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: theme.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.headline5!.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Price: \$${product['price']}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Description:',
                    style: theme.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.subtitle1!.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    description,
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: theme.textTheme.bodyText2!.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Warranty Information: $warranty',
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: theme.textTheme.bodyText2!.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Shipping Information: $shipping',
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: theme.textTheme.bodyText2!.color,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
