class MockSeeds {
  MockSeeds._();

  // Current Logged-in User (Lidiya Aramde - AAU Student)
  static const Map<String, dynamic> currentUser = {
    'id': 'usr_001',
    'name': 'Lidiya Aramde',
    'email': 'lidiyurr@gmail.com',
    'department': 'Software Engineering',
    'yearOfStudy': 4,
    'enrolledCourseIds': ['course_01', 'course_02', 'course_04'],
    'availability': [
      {'dayOfWeek': 'Monday', 'startTime': '14:00', 'endTime': '16:00'},
      {'dayOfWeek': 'Wednesday', 'startTime': '10:00', 'endTime': '12:00'},
      {'dayOfWeek': 'Friday', 'startTime': '15:00', 'endTime': '18:00'},
    ],
  };

  // Other AAU Students
  static const List<Map<String, dynamic>> students = [
    {
      'id': 'usr_002',
      'name': 'Ruth Zelalem',
      'email': 'ruthzelalem65@gmail.com',
      'department': 'Software Engineering',
      'yearOfStudy': 4,
    },
    {
      'id': 'usr_003',
      'name': 'Tesnim Hussien',
      'email': 'tesnimhussien432@gmail.com',
      'department': 'Software Engineering',
      'yearOfStudy': 4,
    },
    {
      'id': 'usr_004',
      'name': 'Tsion Bizuayehu',
      'email': 'tsion.bizu@gmail.com',
      'department': 'Software Engineering',
      'yearOfStudy': 4,
    },
    {
      'id': 'usr_005',
      'name': 'Rediet Assefa',
      'email': 'rediet.assefa@aau.edu.et',
      'department': 'Computer Science',
      'yearOfStudy': 4,
    },
  ];

  // AAU Department Courses
  static const List<Map<String, dynamic>> courses = [
    {
      'id': 'course_01',
      'courseCode': 'SEng3112',
      'courseName': 'Mobile Application Development',
      'department': 'Software Engineering',
    },
    {
      'id': 'course_02',
      'courseCode': 'SEng3121',
      'courseName': 'Software Architecture and Design',
      'department': 'Software Engineering',
    },
    {
      'id': 'course_03',
      'courseCode': 'CS3101',
      'courseName': 'Operating Systems',
      'department': 'Computer Science',
    },
    {
      'id': 'course_04',
      'courseCode': 'SEng4131',
      'courseName': 'Artificial Intelligence',
      'department': 'Software Engineering',
    },
    {
      'id': 'course_05',
      'courseCode': 'CS3202',
      'courseName': 'Database Systems',
      'department': 'Computer Science',
    },
  ];

  // Seed Study Groups
  static const List<Map<String, dynamic>> studyGroups = [
    {
      'id': 'grp_001',
      'name': 'Flutter & Dart Pioneers',
      'courseId': 'course_01',
      'courseCode': 'SEng3112',
      'courseName': 'Mobile Application Development',
      'description': 'Weekly collaboration on Flutter lab projects, Riverpod state patterns, and Milestone preparations.',
      'creatorId': 'usr_001',
      'creatorName': 'Lidiya Aramde',
      'memberCount': 4,
      'isMember': true,
    },
    {
      'id': 'grp_002',
      'name': 'Architecture Patterns Squad',
      'courseId': 'course_02',
      'courseCode': 'SEng3121',
      'courseName': 'Software Architecture and Design',
      'description': 'Analyzing clean architecture, repository patterns, microservices, and design trade-offs.',
      'creatorId': 'usr_002',
      'creatorName': 'Ruth Zelalem',
      'memberCount': 5,
      'isMember': true,
    },
    {
      'id': 'grp_003',
      'name': 'OS Kernel Explorers',
      'courseId': 'course_03',
      'courseCode': 'CS3101',
      'courseName': 'Operating Systems',
      'description': 'Reviewing process scheduling algorithms, memory management, and deadlock prevention before midterm.',
      'creatorId': 'usr_005',
      'creatorName': 'Rediet Assefa',
      'memberCount': 3,
      'isMember': false,
    },
    {
      'id': 'grp_004',
      'name': 'AI & Gemini Research Group',
      'courseId': 'course_04',
      'courseCode': 'SEng4131',
      'courseName': 'Artificial Intelligence',
      'description': 'Exploring prompt engineering, LLM integration, and FastAPI backends for intelligent agents.',
      'creatorId': 'usr_003',
      'creatorName': 'Tesnim Hussien',
      'memberCount': 6,
      'isMember': false,
    },
  ];

  // Seed Study Sessions
  static const List<Map<String, dynamic>> studySessions = [
    {
      'id': 'sess_001',
      'groupId': 'grp_001',
      'courseCode': 'SEng3112',
      'topic': 'Milestone 1 go_router & Riverpod Review',
      'date': '2026-11-20',
      'startTime': '14:00',
      'endTime': '16:00',
      'meetingPlace': 'AAU 4 Kilo Campus Library, 2nd Floor Study Room B',
      'latitude': 9.0353,
      'longitude': 38.7628,
      'organizerId': 'usr_001',
      'organizerName': 'Lidiya Aramde',
      'memberIds': ['usr_001', 'usr_002', 'usr_003', 'usr_004'],
      'memberNames': ['Lidiya Aramde', 'Ruth Zelalem', 'Tesnim Hussien', 'Tsion Bizuayehu'],
      'isJoined': true,
    },
    {
      'id': 'sess_002',
      'groupId': 'grp_002',
      'courseCode': 'SEng3121',
      'topic': 'Domain-Driven Design Diagrams Discussion',
      'date': '2026-11-22',
      'startTime': '10:00',
      'endTime': '12:00',
      'meetingPlace': 'Science Faculty Block C, Room 304',
      'latitude': 9.0361,
      'longitude': 38.7615,
      'organizerId': 'usr_002',
      'organizerName': 'Ruth Zelalem',
      'memberIds': ['usr_001', 'usr_002', 'usr_005'],
      'memberNames': ['Lidiya Aramde', 'Ruth Zelalem', 'Rediet Assefa'],
      'isJoined': true,
    },
    {
      'id': 'sess_003',
      'groupId': 'grp_003',
      'courseCode': 'CS3101',
      'topic': 'CPU Scheduling Exam Preparation',
      'date': '2026-11-24',
      'startTime': '15:30',
      'endTime': '17:30',
      'meetingPlace': 'FBE ICT Lab Lounge',
      'latitude': 9.0340,
      'longitude': 38.7640,
      'organizerId': 'usr_005',
      'organizerName': 'Rediet Assefa',
      'memberIds': ['usr_005', 'usr_003'],
      'memberNames': ['Rediet Assefa', 'Tesnim Hussien'],
      'isJoined': false,
    },
  ];
}

