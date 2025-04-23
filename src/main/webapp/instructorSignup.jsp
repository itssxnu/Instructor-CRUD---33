<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/23/2025
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Instructor Signup</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center px-4">
<div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-3xl">
  <h2 class="text-3xl font-bold mb-6 text-center text-indigo-600">Instructor Signup</h2>
  <form action="instructorSignup" method="post" enctype="multipart/form-data" class="grid grid-cols-1 md:grid-cols-2 gap-6">
    <div>
      <label class="block text-sm font-medium text-gray-700">First Name</label>
      <input name="firstName" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Last Name</label>
      <input name="lastName" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Date of Birth</label>
      <input type="date" name="dob" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Gender</label>
      <input name="gender" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Nationality</label>
      <input name="nationality" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">NIC</label>
      <input name="nic" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Profile Picture</label>
      <input type="file" name="profilePicture" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Phone</label>
      <input name="phone" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Qualification</label>
      <input name="qualification" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Specialization</label>
      <input name="specialization" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Experience (years)</label>
      <input type="number" name="experience" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Department</label>
      <input name="department" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Designation</label>
      <input name="designation" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Email</label>
      <input type="email" name="email" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>
    <div>
      <label class="block text-sm font-medium text-gray-700">Password</label>
      <input type="password" name="password" class="mt-1 p-2 border border-gray-300 rounded w-full" required>
    </div>

    <div class="md:col-span-2">
      <button type="submit" class="w-full bg-indigo-600 text-white font-semibold py-2 px-4 rounded hover:bg-indigo-700 transition">Sign Up</button>
    </div>
  </form>
</div>
</body>
</html>

