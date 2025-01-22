<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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
                <li><a href="dashboard" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-house mr-3"></i> Dashboard</a></li>
                <li><a href="customer" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-users mr-3"></i> Customer</a></li>
                <li><a href="bus" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-bus mr-3"></i> Bus</a></li>
                <li><a href="#" class="flex items-center px-4 py-2 text-lg transition bg-white text-[#9A616D]"><i class="fa-duotone fa-solid fa-ticket mr-3"></i> Ticket Booking</a></li>
                <li><a href="booked" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-list-check mr-3"></i>Booked ticket</a></li>
              </ul>

            <ul class="py-4">
                <li><a href="<c:url value='/' />" class="block ml-5 mr-5 px-4 py-2 text-center text-white bg-black rounded-md transition hover:bg-white hover:text-[#9A616D]">Log Out</a></li>
                
               
            </ul>
        </nav>
         <!-- Page Content -->
        <div id="content" class="flex-1 p-6 ml-10 mr-10">
            <nav class="flex items-center justify-between bg-[#9A616D]  text-white p-6  shadow text-2xl ">
               <Strong><h2>Book Ticket  </i></h2></Strong>              
            </nav>
              <c:if test="${not empty ticketmsg}">
    <div class="alert alert-primary mt-2">
        ${ticketmsg}
    </div>
</c:if>
  <form class="mt-3" action = "ticketbus" method="get">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
    <!-- Left Column -->
    <div class="space-y-4">
  
<div class="form-group mt-2">
    <label for="busType" class="block">Source</label>
  <select id="source" name="source" class="form-control">
  <option value="" selected disabled>Select your source</option>
    <option value="Rajasthan">Rajasthan</option>
    <option value="Madhya Pradesh">Madhya Pradesh</option>
    <option value="Punjab">Punjab</option>
  </select>	
</div>
      <div class="form-group mt-2">
    <label for="busType" class="block">Destination</label>
  <select id="destination" name="destination" class="form-control">
  <option value="" selected disabled>Select destination</option>
    <option value="Gujarat" >Gujarat</option>
    <option value="Uttar Pradesh">Uttar Pradesh</option>
    <option value="Chattisgarh">Chattisgarh</option>
  </select>
</div>
    <div class = "container">
			<button type="submit" class="btn btn-success border-none bg-[#9A616D] hover:bg-[#7a4c58] text-white">
  Submit
</button>		
		</div>
      
    </div>

    <!-- Right Column -->
    <div class="space-y-4">
       <div class="form-group mt-2">
        <label for="dob">Date </label>
        <input type="date" class="form-control" name="date" id="dob">
      </div>
    </div>
  </div>
</form>
 
  <table class="table">
  <thead>
    <tr>
      <th>Bus Number</th>
      <th>Type</th>
      <th>Date</th>
      <th>Departure Time</th>
      <th>Source</th>
      <th>Destination</th>
      <th>Price</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="t" items="${bus}">
      <tr>
        <form action="<c:url value='/populateForm' />" method="post">
        
          <td>
            <input type="hidden" name="busno" value="${t.busno}">
            ${t.busno}
          </td>
          <td>
            <input type="hidden" name="type" value="${t.type}">
            ${t.type}
          </td>
          <td>
            <input type="hidden" name="date" value="${t.date}">
            ${t.date}
          </td>
          <td>
            <input type="hidden" name="dept_time" value="${t.dept_time}">
            ${t.dept_time}
          </td>
          <td>
            <input type="hidden" name="source" value="${t.source}">
            ${t.source}
          </td>
          <td>
            <input type="hidden" name="destination" value="${t.destination}">
            ${t.destination}
          </td>
          <td>
            <input type="hidden" name="price" value="${t.price}">
            ${t.price}
          </td>
          <td>
            <button type="submit" class="btn btn-success">Select</button>
          </td>
        </form>
      </tr>
    </c:forEach>
  </tbody>
</table>
  
  <form action="<c:url value='/bookTicket' />" method="post">
  <div class="form-group">
    <label for="busno">Aadhar Card Number</label>
    <input type="text" id="busno" name="aadhar" class="form-control" value="${aadhar}" ></div>
  <div class="form-group">
    <label for="busno">Firstname</label>
    <input type="text" id="busno" name="firstname" class="form-control" >
  </div>
  <div class="form-group">
    <label for="busno">Lastname</label>
    <input type="text" id="busno" name="lastname" class="form-control" >
  </div>
  <div class="form-group">
    <label for="busno">Bus Number</label>
    <input type="text" id="busno" name="busno" class="form-control" value="${busno}" readonly >${busno}</input>
  </div>
  <div class="form-group">
    <label for="type">Type</label>
    <input type="text" id="type" name="type" class="form-control" value="${type}" readonly>
  </div>
  <div class="form-group">
    <label for="date">Date</label>
    <input type="text" id="date" name="date" class="form-control" value="${date}" readonly>
  </div>
  <div class="form-group">
    <label for="dept_time">Departure Time</label>
    <input type="text" id="dept_time" name="dept_time" class="form-control" value="${dept_time}" readonly>
  </div>
  <div class="form-group">
    <label for="source">Source</label>
    <input type="text" id="source" name="source" class="form-control" value="${source}" readonly>
  </div>
  <div class="form-group">
    <label for="destination">Destination</label>
    <input type="text" id="destination" name="destination" class="form-control" value="${destination}" readonly>
  </div>
  <div class="form-group">
    <label for="price">Price</label>
    <input  type="text" id="price" name="price" class="form-control" value="${price}" readonly>
  </div>
   <div class="form-group">
     <label for="seats" class="block text-sm font-medium text-gray-700 mb-2">Seats</label>
    <input 
        type="number" 
        id="seats" 
        name="seats" 
        class="form-control" 
        value="1" 
        min="1" 
        max="10" 
        step="1"> <div class = "container">
			
  </div>
  <div class="form-group">
    <label for="price">Total Amount</label>
    <input type="text" id="price" name="totalamount" class="form-control">
  </div>
  <button type="submit" class="btn btn-primary">Book Ticket</button>
</form>
  
</div>
  
 
        </div>
        
        
        
</body>
</html>