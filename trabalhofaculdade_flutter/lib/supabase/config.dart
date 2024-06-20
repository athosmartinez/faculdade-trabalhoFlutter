import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> configSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://reczebfppgxznxjpzfls.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJlY3plYmZwcGd4em54anB6ZmxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc2MzI0MTIsImV4cCI6MjAzMzIwODQxMn0.Jvtw3y6RBtSJYeGsy-odl0MEzwVfZKhKrpX7vPQZrP0',
  );
}

final supabase = Supabase.instance.client;