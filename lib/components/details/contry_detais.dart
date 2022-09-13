import 'package:aula02/models/meal_country_model.dart';
import 'package:flutter/material.dart';

class ContryListDetais extends StatelessWidget {
  final CountryModel country;
  const ContryListDetais(this.country, {Key? key}) : super(key: key);
  void _selectCountry(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/meals_page",
      arguments: country,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        return _selectCountry(context);
      },
      splashColor: Colors.orange,
      borderRadius: BorderRadius.circular(20),
      child: Stack(children: [
        MyRadiusImage(
          circular: 12,
          comprimento: 230,
          largura: size.width * .52,
          margin: 8,
          url: country.image,
        ),
        SizedBox(
          width: size.width * .52,
          height: size.height * .3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: MyRadiusImage(
                  largura: 30,
                  comprimento: 30,
                  margin: 0.0,
                  url: country.imageCountry,
                  circular: 12,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.8),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                width: size.width * .52,
                height: size.height * .10,
                child: ListTile(
                  title: Text(
                    country.country,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    country.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyRadiusImage({
    required double largura,
    required double comprimento,
    required double margin,
    required String url,
    required double circular,
  }) {
    return Container(
      width: largura,
      height: comprimento,
      margin: EdgeInsets.only(right: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
