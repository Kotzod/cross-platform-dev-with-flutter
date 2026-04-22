import 'package:flutter/material.dart';
import '../models/team_member.dart';

class TeamProfileScreen extends StatefulWidget {
  const TeamProfileScreen({super.key});

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  int _currentIndex = 0;

  final List<TeamMember> _teamMembers = const [
    TeamMember(
      name: 'Oliver Chandler',
      role: 'Team Leader',
      country: 'Hungary',
      hobbies: 'Running, Hiking',
      motto: 'Never stop learning',
      imagePath: 'assets/images/member1.png',
    ),
    TeamMember(
      name: 'Min Zaw',
      role: 'Developer',
      country: 'Myanmar',
      hobbies: 'Gaming, Coding',
      motto: 'Code is poetry',
      imagePath: 'assets/images/member2.png',
    ),
    TeamMember(
      name: 'May Khine',
      role: 'Designer',
      country: 'Myanmar',
      hobbies: 'Drawing, Photography',
      motto: 'Design with purpose',
      imagePath: 'assets/images/member3.png',
    ),
  ];

  void _previousMember() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _teamMembers.length) % _teamMembers.length;
    });
  }

  void _nextMember() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _teamMembers.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final currentMember = _teamMembers[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Amazing Team'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.blue.shade50),
              child: Column(
                children: [
                  const Icon(Icons.groups, size: 60, color: Colors.blue),
                  const SizedBox(height: 12),
                  const Text(
                    'Team Awesome',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We build amazing mobile applications with Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Member ${_currentIndex + 1} of ${_teamMembers.length}',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 16),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade200, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        currentMember
                            .imagePath,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    currentMember.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      currentMember.role,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildInfoRow(Icons.flag, 'Country', currentMember.country),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    Icons.favorite,
                    'Hobbies',
                    currentMember.hobbies,
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    Icons.format_quote,
                    'Motto',
                    currentMember.motto,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _previousMember,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // Next Button
                ElevatedButton.icon(
                  onPressed: _nextMember,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blue.shade700),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
