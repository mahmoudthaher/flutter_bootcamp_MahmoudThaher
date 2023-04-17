import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/bloc/products/products_bloc.dart';
import 'package:flutter_exam/bloc/products/products_events.dart';
import 'package:flutter_exam/bloc/products/products_states.dart';
import 'package:flutter_exam/models/product_model.dart';

import '../bloc/users/users_bloc.dart';
import '../bloc/users/users_events.dart';

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
          onTap: () {
            context.read<ProductsBloc>().add(GetProductsEvent());
          },
          title: Text(_products[index].name),
          subtitle: Row(
            children: [
              SizedBox(
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        // context.read<UsersBloc>().add(IncreaseUserEvent(index));
                      },
                      child: Text("+"))),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text("${_products[index].id}"),
              ),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // context.read<UsersBloc>().add(DecreaseUserEvent(index));
                  },
                  child: Text("-"),
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                context.read<UsersBloc>().add(RemoveUserEvent(index));
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        );
      },
    );
  }
}
