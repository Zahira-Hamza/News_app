import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../model/NewsResponse.dart';
import '../../model/source.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  final String searchQuery;

  const NewsWidget({
    super.key,
    required this.source,
    this.searchQuery = "",
  });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final ScrollController _scrollController = ScrollController();

  final int _pageSize = 20; // تقدري تغيريها
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  List<Articles> _articles = [];

  @override
  void initState() {
    super.initState();
    _fetchPage();

    _scrollController.addListener(() {
      // لما يقرب من آخر الليست بـ 200 بكسل يجيب الصفحة اللي بعدها
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _fetchPage();
      }
    });
  }

  // لو اتغير المصدر (تبويب جديد) نرجّع الحالة من الأول
  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      _resetAndReload();
    }
    // مفيش حاجة مطلوبة للبحث هنا؛ الفلترة بتحصل في build على الليست المجمّعة
  }

  void _resetAndReload() {
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    _error = null;
    _articles = [];
    setState(() {});
    _fetchPage();
  }

  Future<void> _fetchPage() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final resp = await ApiManager.getNewsSources(
        widget.source.id ?? '',
        page: _page,
        pageSize: _pageSize,
      );

      if (resp.status != 'ok') {
        throw Exception(resp.message ?? 'Unknown error'.tr());
      }

      final fetched = resp.articles ?? [];

      setState(() {
        _articles.addAll(fetched);
        if (fetched.length < _pageSize) _hasMore = false;
        _page += 1;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // فلترة حسب البحث على اللي اتحمّل كله لحد دلوقتي
    List<Articles> visible = widget.searchQuery.isEmpty
        ? _articles
        : _articles
            .where((a) => (a.title ?? '')
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase()))
            .toList();

    // أول تحميل
    if (_articles.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.grey));
    }

    // خطأ في أول تحميل
    if (_articles.isEmpty && _error != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _fetchPage,
              child: Text(
                'Try again'.tr(),
              ),
            )
          ],
        ),
      );
    }

    // مفيش نتائج مطابقة للبحث
    if (visible.isEmpty && widget.searchQuery.isNotEmpty) {
      return Center(child: Text("No results found".tr()));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: visible.length + (_isLoading ? 1 : 0), // عنصر سبينر في الآخر
      itemBuilder: (context, index) {
        if (index < visible.length) {
          return NewsItem(articles: visible[index]); //  نفس الشكل
        }
        // آخر عنصر = لودينج صغير أثناء تحميل صفحة جديدة
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: CircularProgressIndicator(color: Colors.grey)),
        );
      },
    );
  }
}
