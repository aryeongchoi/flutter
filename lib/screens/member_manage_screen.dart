import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MemberManageScreen extends StatefulWidget {
  const MemberManageScreen({super.key});

  @override
  State<MemberManageScreen> createState() => _MemberManageScreenState();
}

class _MemberManageScreenState extends State<MemberManageScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  List<String> friends = ['김ㅇㅇ', '김ㅇㅇ', '김ㅇㅇ', '김ㅇㅇ'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA724)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '공유 멤버 관리',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person_add_alt_1, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0)))),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: const Color(0xFFFFA724),
              tabs: const [
                Tab(text: '친구'),
                Tab(text: '요청'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildFriendTab(),
                const Center(child: Text('요청 목록')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('${friends.length}명', style: const TextStyle(fontSize: 14, color: Colors.black)),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: friends.length,
              separatorBuilder: (_, __) => const Divider(color: Color(0xFFE0E0E0)),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(friends[index]),
                  trailing: const Icon(Icons.delete_outline, color: Colors.grey),
                  onTap: () {}, // 친구 클릭 시
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
        hintText: '친구의 닉네임을 검색하세요.',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
      ),
      onChanged: (query) {
        // 검색 필터링 로직 추가 가능
      },
    );
  }
}
