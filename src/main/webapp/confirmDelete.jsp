<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/25/2025
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirm Deletion</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-md">
  <h2 class="text-2xl font-bold text-center text-red-600 mb-6">Confirm Account Deletion</h2>
  <p class="text-gray-700 mb-6">Are you sure you want to permanently delete your account? This action cannot be undone.</p>

  <form action="manageInstructor" method="post" class="space-y-4">
    <input type="hidden" name="action" value="delete">

    <div class="flex space-x-2">
      <button type="submit"
              class="flex-1 bg-red-600 text-white py-2 rounded-lg hover:bg-red-700">
        Yes, Delete My Account
      </button>
      <a href="instructorDashboard"
         class="flex-1 bg-gray-500 text-white text-center py-2 rounded-lg hover:bg-gray-600">
        Cancel
      </a>
    </div>
  </form>
</div>
</body>
</html>
