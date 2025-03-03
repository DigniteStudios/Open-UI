
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:open_ui/core/extensions/text_theme_extension.dart';

import '../../domain/entities/product_entity.dart';
import '../provider/product_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(productProvider.notifier).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> products = ref.watch(productProvider).products;
    return Scaffold(
      appBar: AppBar(
        title: Text("ISSACS".toUpperCase()),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15)
            ),
            color: Colors.black87,
        ),
        child: RefreshIndicator(
          onRefresh: ref.read(productProvider.notifier).getProducts,
          child: MasonryGridView.builder(
            padding: const EdgeInsets.all(15).copyWith(
              top: 30
            ),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemCount: products.length,
            itemBuilder: (context, index) {
              ProductEntity product = products[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5.0,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0)
                    )]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(product.image),
                      const SizedBox.square(dimension: 15,),
                      Text(product.title,
                        textAlign: TextAlign.center,
                        style: context.labelMedium,
                      ),
                      const SizedBox.square(dimension: 5),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("\$${product.price}",
                            textAlign: TextAlign.center,
                            style: context.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
