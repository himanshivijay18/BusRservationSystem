<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page isELIgnored = "false" %>
    <!DOCTYPE html>
    
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <title>dashboard Form</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body >
<div class="flex w-full min-h-screen">
        <!-- Sidebar -->
        <nav id="sidebar" class="min-w-[250px] max-w-[250px] bg-[#9A616D] text-white transition-all">
            <div class="p-4 ">
                <h3 class="text-3xl font-semibold"><i>UrbanWheels</i></h3>
            </div>

            <ul class="py-5">
                <li><a href="#" class="flex items-center px-4 py-2 text-lg transition bg-white text-[#9A616D]"><i class="fa-duotone fa-solid fa-house mr-3"></i> Dashboard</a></li>
                <li><a href="customer" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-users mr-3"></i> Customer</a></li>
                <li><a href="bus" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-bus mr-3"></i> Bus</a></li>
                <li><a href="ticket" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-ticket mr-3"></i> Ticket Booking</a></li>
                <li><a href="booked" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-list-check mr-3"></i>Booked ticket</a></li>
              </ul>

            <ul class="py-4">
                <li><a href="<c:url value='/' />" class="block ml-5 mr-5 px-4 py-2 text-center text-white bg-black rounded-md transition hover:bg-white hover:text-[#9A616D]">Log Out</a></li>
                
               
            </ul>
        </nav>


        <!-- Page Content -->
        <div id="content" class="flex-1 p-6">
            <nav class="flex items-center justify-between p-4 bg-white shadow text-2xl">
               <Strong><h2>Welcome to the <i>UrbanWheels</i></h2></Strong>              
            </nav>

    <div class="cardBox grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8 p-5 ">
    <div class="card relative bg-white p-8 rounded-2xl flex justify-between cursor-pointer shadow-md hover:bg-[#9A616D] hover:text-white">
        <div>
            <div class="numbers text-4xl font-semibold text-black hover:text-white">${cust_no}</div>
            <div class="cardName text-gray-800 text-lg mt-1 hover:text-white">Total Customers</div>
        </div>

        <div class="iconBx text-5xl text-gray-800 ">
           <i class="fa-solid fa-users"></i>
        </div>
    </div>
     <div class="card relative bg-white p-8 rounded-2xl flex justify-between cursor-pointer shadow-md hover:bg-[#9A616D] hover:text-white">
        <div>
            <div class="numbers text-4xl font-semibold text-black hover:text-white">${bus_no}</div>
            <div class="cardName text-gray-800 text-lg mt-1 hover:text-white">Total buses</div>
        </div>

        <div class="iconBx text-5xl text-gray-800 ">
          <i class="fa-solid fa-bus"></i>
        </div>
    </div>
     <div class="card relative bg-white p-8 rounded-2xl flex justify-between cursor-pointer shadow-md hover:bg-[#9A616D] hover:text-white">
        <div>
            <div class="numbers text-4xl font-semibold text-black hover:text-white">${booked_no}</div>
            <div class="cardName text-gray-800 text-lg mt-1 hover:text-white">	Booked tickets </div>
        </div>

        <div class="iconBx text-5xl text-gray-800 ">
        <i class="fa-solid fa-list-check"></i>
        </div>
    </div>
     <div class="card relative bg-white p-8 rounded-2xl flex justify-between cursor-pointer shadow-md hover:bg-[#9A616D] hover:text-white">
        <div>
            <div class="numbers text-4xl font-semibold text-black hover:text-white">${cancelled_no}</div>
            <div class="cardName text-gray-800 text-lg mt-1 hover:text-white">Cancelled tickets</div>
        </div>

        <div class="iconBx text-5xl text-gray-800 ">
          <i class="fa-solid fa-rectangle-xmark"></i>
        </div>
    </div>
     
</div>
        
        
    </div>
    

</body>
</html>
