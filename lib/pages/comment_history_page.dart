import 'package:flutter/material.dart';
import '../components/tab_bar.dart';
import 'package:intl/intl.dart';

enum CommentStatus {
  pending,
  approved,
  rejected,
}

class Comment {
  final DateTime date;
  final String commentText;
  final String locationAndEvent;
  CommentStatus status;

  Comment({
    required this.date,
    required this.commentText,
    required this.locationAndEvent,
    this.status = CommentStatus.pending,
  });
}

class CommentHistoryPage extends StatefulWidget {
  @override
  _CommentHistoryPageState createState() => _CommentHistoryPageState();
}

class _CommentHistoryPageState extends State<CommentHistoryPage> {
  List<Comment> _allComments = [];

  @override
  void initState() {
    super.initState();
    _allComments = [
      Comment(
        date: DateTime(2024, 4, 25, 13, 41),
        commentText: '"Yemekler çok lezzetliydi, servis hızlıydı."',
        locationAndEvent: 'Gözaltı Pub · Suçluların Partisi',
        status: CommentStatus.approved,
      ),
      Comment(
        date: DateTime(2024, 4, 26, 15, 20),
        commentText: '"Müzikler harikaydı, ortam çok eğlenceliydi."',
        locationAndEvent: 'Rock Bar · Gece Konseri',
        status: CommentStatus.approved,
      ),
      Comment(
        date: DateTime(2024, 4, 27, 19, 00),
        commentText: '"Kokteyller muhteşemdi, barmen çok yetenekliydi."',
        locationAndEvent: 'Lounge 1453 · Özel Etkinlik',
        status: CommentStatus.approved,
      ),
      Comment(
        date: DateTime(2024, 4, 28, 12, 30),
        commentText: '"Kahve harikaydı, atmosfer çok sıcakkanlıydı."',
        locationAndEvent: 'Kahve Diyarı · Haftasonu Buluşması',
        status: CommentStatus.approved,
      ),
      Comment(
        date: DateTime(2024, 4, 29, 22, 00),
        commentText: '"Tatlılar çok güzeldi, sunum etkileyiciydi."',
        locationAndEvent: 'Pastane Köşesi · Akşam Tatlıları',
        status: CommentStatus.approved,
      ),
      Comment(
        date: DateTime.now().subtract(Duration(days: 1, hours: 0, minutes: 37)),
        commentText:
            '"Bu mekan tam bir rezalet, hakaret içerikli personel dolu!"',
        locationAndEvent: 'İzmirde Alkol Mekanı · Happy Hour',
        status: CommentStatus.rejected,
      ),
      Comment(
        date:
            DateTime.now().subtract(Duration(days: 1, hours: 13, minutes: 45)),
        commentText: '"Menü çok zengin ve fiyatlar makul."',
        locationAndEvent: 'İzmir Kafe · Kahve Keyfi',
        status: CommentStatus.pending,
      ),
      Comment(
        date: DateTime.now().subtract(Duration(days: 1, hours: 8, minutes: 0)),
        commentText: '"Müzik seçimi ve ortam oldukça başarılı."',
        locationAndEvent: 'İzmir Bar · Canlı Müzik',
        status: CommentStatus.pending,
      ),
    ];
    _allComments.sort((a, b) => b.date.compareTo(a.date));
    _filteredComments = _allComments;
  }

  List<Comment> _filteredComments = [];

  String _searchText = '';
  String _selectedSortOption = '';

  void _filterCommentsByStatus(CommentStatus? status) {
    setState(() {
      if (status == null) {
        _filteredComments = _allComments;
      } else {
        _filteredComments =
            _allComments.where((comment) => comment.status == status).toList();
      }
    });
  }

  void _filterComments(String query) {
    setState(() {
      _searchText = query;
      if (query.isEmpty) {
        _filterCommentsByStatus(_selectedSortOption.isEmpty
            ? null
            : _selectedSortOption == "Onaylanan"
                ? CommentStatus.approved
                : _selectedSortOption == "Onaylanmayan"
                    ? CommentStatus.rejected
                    : _selectedSortOption == "Beklemede"
                        ? CommentStatus.pending
                        : null);
      } else {
        _filteredComments = _allComments
            .where((comment) =>
                comment.commentText.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _filterCommentsByStatus(_selectedSortOption.isEmpty
            ? null
            : _selectedSortOption == "Onaylanan"
                ? CommentStatus.approved
                : _selectedSortOption == "Onaylanmayan"
                    ? CommentStatus.rejected
                    : _selectedSortOption == "Beklemede"
                        ? CommentStatus.pending
                        : null);
        _filteredComments = _filteredComments
            .where((comment) =>
                comment.commentText.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _sortCommentsByDate(String option) {
    setState(() {
      if (option == 'Tarih (en yeni)') {
        _allComments.sort((a, b) => b.date.compareTo(a.date));
      } else if (option == 'Tarih (en eski)') {
        _allComments.sort((a, b) => a.date.compareTo(b.date));
      }
      _filterCommentsByStatus(_selectedSortOption.isEmpty
          ? null
          : _selectedSortOption == "Onaylanan"
              ? CommentStatus.approved
              : _selectedSortOption == "Onaylanmayan"
                  ? CommentStatus.rejected
                  : _selectedSortOption == "Beklemede"
                      ? CommentStatus.pending
                      : null);
      _filterComments(_searchText);
    });
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('dd MMMM y, EEEE · HH:mm', 'tr_TR');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Yorumlarım" Başlığı
            Text(
              "Yorumlarım",
              style: TextStyle(
                color: Color(0xFFC62038),
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            // Arama Çubuğu
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Ara...",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: _filterComments,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      _filterComments(_searchText);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Sıralama ve Filtreleme Seçenekleri
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: "Tarih (en yeni)",
                    hint: Text("Sırala"),
                    items: [
                      DropdownMenuItem(
                        value: "Tarih (en yeni)",
                        child: Text("Tarih (en yeni)"),
                      ),
                      DropdownMenuItem(
                        value: "Tarih (en eski)",
                        child: Text("Tarih (en eski)"),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        _sortCommentsByDate(value);
                      }
                    },
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  for (var label in [
                    "Tümü",
                    "Onaylanan",
                    "Onaylanmayan",
                    "Beklemede"
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedSortOption = label;
                            _filterCommentsByStatus(label == "Tümü"
                                ? null
                                : label == "Onaylanan"
                                    ? CommentStatus.approved
                                    : label == "Onaylanmayan"
                                        ? CommentStatus.rejected
                                        : label == "Beklemede"
                                            ? CommentStatus.pending
                                            : null);
                            _filterComments(_searchText);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Yorum Listesi
            Expanded(
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(Color(0xFF20C6AE)),
                  radius: Radius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: _filteredComments.length,
                  itemBuilder: (context, index) {
                    final comment = _filteredComments[index];
                    Color? backgroundColor;
                    if (comment.status == CommentStatus.pending) {
                      backgroundColor = Colors.yellow[100];
                    } else if (comment.status == CommentStatus.rejected) {
                      backgroundColor = Colors.red[100];
                    }

                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8), // Adjusted Margin
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          gradient: backgroundColor != null
                              ? LinearGradient(
                                  colors: [
                                    backgroundColor,
                                    Colors.white,
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : null),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Transaction Date
                          Text(
                            _formatDate(comment.date),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),

                          // User Comment
                          Text(
                            comment.commentText,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Location and Event info with outlined location icon
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 16, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                comment.locationAndEvent,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
