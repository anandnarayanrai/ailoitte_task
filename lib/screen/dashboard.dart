import 'package:ailoitte_task/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:ailoitte_task/models/rum_model.dart';
import 'package:ailoitte_task/screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardBloc _newsBloc = DashboardBloc();

  @override
  void initState() {
    _newsBloc.add(GetModelList("rum"));
    super.initState();
  }

  onItemChanged(String value) {
    if (value.length > 1 || value.isEmpty) {
      _newsBloc.add(GetModelList(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ailoitte Task (Anand Rai)")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: BlocProvider(
                  create: (_) => _newsBloc,
                  child: BlocListener<DashboardBloc, DashboardState>(
                    listener: (context, state) {
                      if (state is DashboardError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        if (state is DashboardInitial) {
                          return _buildLoading();
                        } else if (state is DashboardLoading) {
                          return _buildLoading();
                        } else if (state is DashboardLoaded) {
                          return _buildCard(context, state.rumModel);
                        } else if (state is DashboardError) {
                          return const Center(
                            child: Text("Server Error"),
                          );
                        } else {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, RumModel model) {
    return model.drinks!.isNotEmpty
        ? ListView.builder(
      itemCount: model.drinks!.length,
      itemBuilder: (context, index) {
        Drinks item = model.drinks![index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(_createRoute(item));
          },
          child: listItem(item),
        );
      },
    )
        : Center(
        child: Column(
          children: [
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            const Text("Data not found"),
          ],
        ));
  }

  Widget listItem(Drinks item) {
    return SizedBox(
      height: 130,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  item.strDrinkThumb!,
                  height: 122,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.strDrink!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      Text(
                        "(${item.strCategory})",
                        style: const TextStyle(
                            fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Glass: ${item.strGlass}"),
                      const SizedBox(
                        height: 2,
                      ),
                      Text("Alcoholic: ${item.strAlcoholic}"),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${item.strInstructions}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Route _createRoute(Drinks drinks) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Detail(
            drinks: drinks,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
