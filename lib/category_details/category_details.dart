import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/category_details/source/source_tab_widget.dart';
import 'package:news_app/model/category_widget.dart';

import '../ui/home/cubit/category_sources_states.dart';
import '../ui/home/cubit/category_sources_viewModel.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryWidget category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  bool _isSearching = false;
  String _searchQuery = "";
  CategorySourcesViewmodel viewmodel = CategorySourcesViewmodel();
  void initState() {
    super.initState();
    viewmodel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //  يمنع ظهور سهم الرجوع
        title: _isSearching
            ? TextField(
                autofocus: true,
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                  hintText: "Search...".tr(),
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : null, //  مفيش عنوان
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                _searchQuery = "";
              });
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => viewmodel,
        child: BlocBuilder<CategorySourcesViewmodel, CategorySourcesStates>(
          builder: (context, state) {
            if (state is SourceLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.grey),
              );
            } else if (state is SourceErrorState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(state.errorMessage,
                        style: Theme.of(context).textTheme.headlineSmall),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('try again',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ],
                ),
              );
            } else if (state is SourceSuccessState) {
              return SourceTabWidget(
                sourcesList: state.sourcesList,
                searchQuery: _searchQuery,
              );
            }
            return Container();
          },
        ),
      ),
      // body: FutureBuilder<SourceResponse>(
      //   future: ApiManager.getSources(widget.category.id),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(color: Colors.grey),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text(snapshot.error.toString()),
      //       );
      //     }
      //
      //     if (snapshot.data?.status != 'ok') {
      //       return Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Column(
      //           children: [
      //             Text(snapshot.data?.message ?? '',
      //                 style: Theme.of(context).textTheme.headlineSmall),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colors.red,
      //               ),
      //               onPressed: () {
      //                 setState(() {});
      //               },
      //               child: Text('try again',
      //                   style: Theme.of(context).textTheme.headlineSmall),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //
      //     var sourcesList = snapshot.data?.sources ?? [];
      //     return SourceTabWidget(
      //       sourcesList: sourcesList,
      //       searchQuery: _searchQuery,
      //     );
      //   },
      // ),
    );
  }
}
