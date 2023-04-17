import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/bloc/products/products_bloc.dart';
import 'package:flutter_exam/bloc/products/products_events.dart';
import 'package:flutter_exam/bloc/products/products_states.dart';
import 'package:flutter_exam/models/product_model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: Scaffold(
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return buildListView(context, state.products);
            }
            if (state is FailureState) {
              return const Center(child: Text("There are some errors"));
            }
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<ProductsBloc>().add(GetProductsEvent());
                  },
                  child: const Text("Fetch Products")),
            );
          },
        ),
      ),
    );
  }

  Widget buildListView(context, List<ProductModel>? _products) {
    return ListView.builder(
      itemCount: _products!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: SizedBox(
            child: Text(_products[index].name),
            height: 50,
          ),
          subtitle: Column(
            children: [
              Image(
                image: NetworkImage(_products[index].image),
                width: 70,
                height: 70,
              ),
            ],
          ),
          trailing: Column(
            children: [
              SizedBox(
                  width: 50,
                  height: 20,
                  child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProductsBloc>()
                            .add(IncreaseProductEvent(index));
                      },
                      child: Text("+"))),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text("${_products[index].counter}"),
              ),
              SizedBox(
                width: 50,
                height: 20,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ProductsBloc>()
                        .add(DecreaseProductEvent(index));
                  },
                  child: Text("-"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
