<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/23/2025
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Instructor Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-md">
    <h2 class="text-3xl font-bold text-center text-indigo-700 mb-6">Instructor Login</h2>
    <form action="instructorLogin" method="post" class="space-y-6">
        <div>
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" required>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" required>
        </div>
        <div>
            <button type="submit" class="w-full bg-indigo-600 text-white py-2 rounded-lg font-semibold hover:bg-indigo-700 transition">Login</button>
        </div>
    </form>
    <p class="mt-6 text-sm text-center text-gray-600">
        Don't have an account?
        <a href="instructorSignup.jsp" class="text-indigo-600 hover:underline font-medium">Sign up here</a>
    </p>
</div>
</body>
</html>


