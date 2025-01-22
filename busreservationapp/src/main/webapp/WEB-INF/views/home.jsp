<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#9A616D]">

  <section class="h-screen flex items-center justify-center">
    <div class="container mx-auto p-5">
      <div class="flex justify-center items-center h-full">
        <div class="w-full max-w-4xl">
          <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <div class="flex flex-wrap">
              <!-- Left Image Section -->
              <div class="hidden md:block md:w-1/2">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                  alt="login form" class="w-full h-full object-cover rounded-l-lg">
              </div>
              <!-- Right Form Section -->
              <div class="w-full md:w-1/2 flex items-center">
                <div class="p-6 md:p-10 text-black w-full">
                
                
                  <form action= "<c:url value='/login' />"  method="POST">
                   <!-- Logo -->
                    <div class="flex items-center mb-6">
                      <i class="fas fa-cubes text-2xl text-[#ff6219] mr-3"></i>
                      <span class="text-3xl font-bold"><i>UrbanWheels</i></span>
                    </div>
                    
                    
  <!-- Username Input -->
  <div class="mb-4">
    <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
    <input type="text" id="username" name="username" 
      class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#ff6219] focus:outline-none" required>
  </div>

  <!-- Password Input -->
  <div class="mb-4">
    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
    <input type="password" id="password" name="password" 
      class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#ff6219] focus:outline-none" required>
  </div>

  <!-- Login Button -->
  <div class="mb-4">
    <button type="submit" 
      class="w-full bg-black text-white py-3 rounded-lg hover:bg-gray-800 transition duration-300">
      Login
    </button>
  </div>
</form>

                  
                    
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</body>
</html>
