<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Search</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="flex w-full min-h-screen">
    <!-- Sidebar -->
    <nav id="sidebar" class="min-w-[250px] max-w-[250px] bg-[#9A616D] text-white transition-all">
        <div class="p-3 ">
            <h3 class="text-3xl font-semibold"><i>UrbanWheels</i></h3>
        </div>
        <ul class="py-4">
            <li><a href="<c:url value='/dashboard' />" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-solid fa-house mr-3"></i> Dashboard</a></li>
            <li><a href="<c:url value='/customer' />" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-solid fa-users mr-3"></i> Customer</a></li>
            <li><a href="<c:url value='/bus' />" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-solid fa-bus mr-3"></i> Bus</a></li>
            <li><a href="<c:url value='/ticket' />" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-solid fa-ticket mr-3"></i> Ticket Booking</a></li>
            <li><a href="#" class="block px-4 py-2 text-lg transition bg-white text-[#9A616D]"><i class="fa-solid fa-list-check mr-3"></i>Booked Ticket</a></li>
        </ul>
        <ul class="py-4">
            <li><a href="<c:url value='/' />" class="block ml-5 mr-5 px-4 py-2 text-center text-white bg-black rounded-md transition hover:bg-white hover:text-[#9A616D]">Log Out</a></li>
        </ul>
    </nav>
    <!-- Page Content -->
    <div id="content" class="flex-1 p-6 ml-10 mr-10">
        <nav class="flex items-center justify-between bg-[#9A616D] text-white p-6 shadow text-2xl ">
            <strong><h2>Booked and cancelled Ticket</h2></strong>
        </nav>
        
        <table class="table mt-5">
            <thead>
                <tr>
                    <th>Ticket ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Bus Number</th>
                    <th>Date</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Departure Time</th>
                    <th>Price</th>
                    <th>Seats</th>
                    <th>Total Amount</th>
                    <th>Is Cancelled</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${ticket}">
                    <tr>
                        <td>${ticket.ticketid}</td>
                        <td>${ticket.firstname}</td>
                        <td>${ticket.lastname}</td>
                        <td>${ticket.busno}</td>
                        <td>${ticket.date}</td>
                        <td>${ticket.source}</td>
                        <td>${ticket.destination}</td>
                        <td>${ticket.dept_time}</td>
                        <td>${ticket.price}</td>
                        <td>${ticket.seats}</td>
                        <td>${ticket.totalamount}</td>
                        <td>${ticket.iscancelled}</td>
                        <td><a href = "<c:url value='/ticketcancel/${ticket.ticketid}' />"  class="btn btn-success border-none bg-[#9A616D] hover:bg-[#7a4c58] text-white" >Cancel</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
