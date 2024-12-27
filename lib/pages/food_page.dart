import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_app/theme/theme.dart';
import 'package:food_app/widgets/pill_text.dart';
import 'package:food_app/widgets/food_list.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late TextEditingController _controller;
  List<Map> _foods = [];
  List<String> _tags = [];
  List<Map>? _searchResult;
  List<Map>? _filtered;
  final List<String> _filterTags = [];

  search(String text) {
    if (text == '') {
      setState(() {
        _searchResult = null;
      });
      return;
    }

    List<Map> result = (_filtered ?? _foods)
        .where(
            (food) => food['name'].toLowerCase().contains(text.toLowerCase()))
        .toList();
    setState(() {
      _searchResult = result;
    });
  }

  filter(List<String> tags) {
    if (tags.isEmpty) {
      setState(() {
        _filtered = null;
      });
      return;
    }

    List<List> temp = [];
    for (var tag in tags) {
      temp.add(_foods.where((food) => food['tags'].contains(tag)).toList());
    }

    List _result = temp
        .fold<Set>(
            temp.first.toSet(),
            (previousValue, element) =>
                previousValue.intersection(element.toSet()))
        .toList();

    List<Map> result = [..._result];

    setState(() {
      _filtered = result != [] ? result : null;
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/food.json');
    final Map data = await json.decode(response);
    final List<Map> foods = [...data['foods']];
    List<String> tags = [];
    for (var food in foods) {
      final List<String> __tags = [...food['tags']];
      tags.addAll(__tags);
    }
    setState(() {
      _foods = foods;
      _tags = tags.toSet().toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child:
                              const Icon(Icons.chevron_left_rounded, size: 24)),
                      const SizedBox(width: 16),
                      // Text('Food', style: title('2')),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: search(_controller.text),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEFEEEE),
                            hintText: 'find food by name',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xFF787777)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.only(
                                bottom: 12, top: 12, left: 16),
                            suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 32, right: 24),
                                child: Icon(Icons.search_rounded,
                                    size: 18, color: black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    clipBehavior: Clip.none,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 16,
                            children: _tags
                                .map((e) => GestureDetector(
                                    onTap: () {
                                      if (_filterTags.contains(e)) {
                                        setState(() {
                                          _filterTags.remove(e);
                                        });
                                        filter(_filterTags);
                                      } else {
                                        setState(() {
                                          _filterTags.add(e);
                                        });
                                        filter(_filterTags);
                                      }
                                    },
                                    child: PillText(
                                        text: e,
                                        active: _filterTags.contains(e))))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color(0xFFF9F9F9),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  clipBehavior: Clip.none,
                  child: (_searchResult ?? _filtered ?? _foods).isEmpty
                      ? Container(
                          padding: const EdgeInsets.only(
                              top: 80, left: 20, right: 20),
                          child: Column(children: [
                            const Icon(
                              Icons.search_rounded,
                              size: 100,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Item not found',
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ]))
                      : FoodList(foods: _searchResult ?? _filtered ?? _foods),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
