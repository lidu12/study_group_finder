// State integration drafted with OpenAI Codex. Team review pending.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_provider.dart';
import '../../../profile/presentation/profile_provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class LoginRegistrationScreen extends ConsumerStatefulWidget {
  const LoginRegistrationScreen({super.key});

  @override
  ConsumerState<LoginRegistrationScreen> createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState
    extends ConsumerState<LoginRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  bool _obscurePassword = true;

  final _nameController = TextEditingController(text: 'Tesnim Hussien');
  final _studentIdController = TextEditingController(text: 'UGR/2799/16');
  final _emailController = TextEditingController(text: 'tesnim@aau.edu.et');
  final _passwordController = TextEditingController(text: 'password123');

  String _selectedDepartment = 'Software Engineering';
  int _selectedYear = 3;

  final List<String> _departments = [
    'Software Engineering',
    'Computer Science',
    'Electrical & Computer Engineering',
    'Biomedical Engineering',
    'Mechanical Engineering',
    'Civil Engineering',
  ];

  final List<int> _years = [1, 2, 3, 4, 5];

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      if (!_isLogin) {
        ref
            .read(profileProvider.notifier)
            .updateIdentity(
              name: _nameController.text.trim(),
              email: email,
              studentId: _studentIdController.text.trim(),
              department: _selectedDepartment,
              yearOfStudy: _selectedYear,
            );
      }
      ref.read(authProvider.notifier).signIn(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isLogin
                ? 'Welcome back! Signed in successfully.'
                : 'Account created for ${_nameController.text.trim()}!',
          ),
          backgroundColor: AppColors.primary,
          duration: const Duration(seconds: 2),
        ),
      );
      // Navigate to Home
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo & Header
                  const Icon(
                    Icons.school_rounded,
                    size: 64,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Study Group Finder',
                    style: AppTextStyles.h1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isLogin
                        ? 'Sign in with your university account'
                        : 'Create your Addis Ababa University student profile',
                    style: AppTextStyles.bodySecondary,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),

                  // Mode Toggle
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(
                        value: true,
                        label: Text('Sign In'),
                        icon: Icon(Icons.login),
                      ),
                      ButtonSegment(
                        value: false,
                        label: Text('Register'),
                        icon: Icon(Icons.person_add_alt_1),
                      ),
                    ],
                    selected: {_isLogin},
                    onSelectionChanged: (set) {
                      setState(() {
                        _isLogin = set.first;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Extra Registration Fields
                  if (!_isLogin) ...[
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'e.g. Tesnim Hussien',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _studentIdController,
                      decoration: const InputDecoration(
                        labelText: 'AAU Student ID',
                        prefixIcon: Icon(Icons.badge_outlined),
                        hintText: 'e.g. UGR/2799/16',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your AAU student ID';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedDepartment,
                      decoration: const InputDecoration(
                        labelText: 'Department',
                        prefixIcon: Icon(Icons.account_balance_outlined),
                      ),
                      items: _departments.map((dept) {
                        return DropdownMenuItem(
                          value: dept,
                          child: Text(dept, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _selectedDepartment = val);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<int>(
                      initialValue: _selectedYear,
                      decoration: const InputDecoration(
                        labelText: 'Year of Study',
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                      items: _years.map((year) {
                        return DropdownMenuItem(
                          value: year,
                          child: Text('Year $year'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _selectedYear = val);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'University Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'student@aau.edu.et',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      _isLogin ? 'Sign In' : 'Create Student Account',
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Guest / Quick Access
                  OutlinedButton(
                    onPressed: () => context.go('/home'),
                    child: const Text('Explore as Guest Student'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
