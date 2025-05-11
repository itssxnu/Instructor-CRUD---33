<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/23/2025
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Instructor Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen flex items-center justify-center">
<!-- Error Message Display -->
<% String error = request.getParameter("error"); %>
<% if (error != null) { %>
<div class="fixed top-4 right-4">
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">Error!</strong>
        <span class="block sm:inline"><%= error %></span>
        <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
                <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                    <title>Close</title>
                    <path d="M14.348 14.849a1 1 0 0 1-1.414 0L10 11.414l-2.93 2.93a1 1 0 0 1-1.414-1.414l2.93-2.93-2.93-2.93a1 1 0 0 1 1.414-1.414l2.93 2.93 2.93-2.93a1 1 0 0 1 1.414 1.414l-2.93 2.93 2.93 2.93a1 1 0 0 1 0 1.414z"/>
                </svg>
            </span>
    </div>
</div>
<% } %>

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
</div>

<script>
    setTimeout(() => {
        const errorDiv = document.querySelector('.bg-red-100');
        if (errorDiv) {
            errorDiv.style.display = 'none';
        }
    }, 5000);
</script>
</body>
</html>