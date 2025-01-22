<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored = "false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a href="#" class="block px-4 py-2 text-lg transition bg-white text-[#9A616D]"><i class="fa-duotone fa-solid fa-bus mr-3"></i> Bus</a></li>
                <li><a href="ticket" class="flex items-center px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-ticket mr-3"></i> Ticket Booking</a></li>
                <li><a href="booked" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-list-check mr-3"></i>Booked ticket</a></li>
              </ul>

            <ul class="py-4">
                <li><a href="<c:url value='/' />" class="block ml-5 mr-5 px-4 py-2 text-center text-white bg-black rounded-md transition hover:bg-white hover:text-[#9A616D]">Log Out</a></li>
                
               
            </ul>
        </nav>
         <!-- Page Content -->
        <div id="content" class="flex-1 p-6 ml-10 mr-10">
            <nav class="flex items-center justify-between bg-[#9A616D]  text-white p-6  shadow text-2xl ">
               <Strong><h2>	New Bus Registration Form</i></h2></Strong>              
            </nav>
     <c:if test="${not empty error}">
    <div class="alert alert-danger mt-2">
        ${error}
    </div>
</c:if>
  <c:if test="${not empty success}">
    <div class="alert alert-primary mt-2">
        ${success}
    </div>
</c:if>
            
  <form class="mt-3" action = "bus" method="post">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
    <!-- Left Column -->
    <div class="space-y-4">
      <div class="form-group mt-2">
        <label for="id">Bus Number</label>
        <input type="text" class="form-control" name="busno" id="busno" placeholder="Enter Bus Number">
      </div>
      <div class="form-group mt-2">
        <label for="id">Seat capacity</label>
        <input type="text" class="form-control" name="seat_capacity" id="seat" placeholder="Enter Seat Capacity">
      </div>
<div class="form-group mt-2">
    <label for="busType" class="block">Type of Bus</label>
  <select id="type" name="type" class="form-control">
  <option value="" selected disabled>Select bus type </option>
    <option value="AC">AC</option>
    <option value="Non-AC">Non-AC</option>
    <option value="Sleeper">Sleeper</option>
    <option value="Sitting">Sitting</option>
  </select>
</div>
<div class="form-group mt-2">
    <label for="busType" class="block">Source</label>
  <select id="source" name="source" class="form-control">
   <option value="" selected disabled>Select your source</option>
    <option value="Rajasthan">Rajasthan</option>
    <option value="Madhya Pradesh">Madhya Pradesh</option>
    <option value="Punjab">Punjab</option>
    <option value="Maharashtra">Maharashtra</option>
    <option value="Karnataka">Karnataka</option>
    <option value="Punjab">Uttarakhand</option>
    <option value="Tamil Nadu">Tamil Nadu</option>
  </select>
</div>
      <div class="form-group mt-2">
    <label for="busType" class="block">Destination</label>
  <select id="destination" name="destination" class="form-control">
  <option value="" selected disabled>Select your Destination</option>
    <option value="Gujarat">Gujarat</option>
    <option value="Uttar Pradesh">Uttar Pradesh</option>
    <option value="Chattisgarh">Chattisgarh</option>
     <option value="Jammu">Jammu</option>
      <option value="Kashmir">Kashmir</option>
    <option value="Andhra Pradesh">Andhra Pradesh</option>
    <option value="Haryana">Haryana</option>
    <option value="Chandigarh">Chandigarh</option>
    <option value="Delhi">Delhi</option>
  </select>
</div><div class="form-group mt-2">
        <label for="address">Stops</label>
        <textarea class="form-control" name = "stops" id="stops" rows="3" placeholder="Enter stops"></textarea>
      </div>
      
     
   
    </div>

    <!-- Right Column -->
    <div class="space-y-4">
      <div class="form-group mt-2">
        <label for="dob">Date</label>
        <input type="date" class="form-control" name="date" id="dob">
      </div>
      <div class="form-group mt-2">
    <label for="busType" class="block">Departure days</label>
  <select id="type" name="dept_day" class="form-control">
  <option value="" selected disabled>Select day </option>
    <option value="Monday">Monday</option>
    <option value="Tuesday">Tuesday</option>
    <option value="Wednesday">Wednesday</option>
    <option value="Thursday">Thursday</option>
    <option value="Friday">Friday</option>
    <option value="Saturday">Saturday</option>
    <option value="Sunday">Sunday</option>
  </select>
</div>
      <div class="form-group mt-2">
        <label for="aadhar">Departure time</label>
        <input type="time" class="form-control" name="dept_time" id="departure" placeholder="00:00"   >
      </div>
       <div class="form-group mt-2">
    <label for="busType" class="block">Arrival days</label>
  <select id="type" name="arrival_day" class="form-control">
  <option value="" selected disabled>Select day </option>
    <option value="Monday">Monday</option>
    <option value="Tuesday">Tuesday</option>
    <option value="Wednesday">Wednesday</option>
    <option value="Thursday">Thursday</option>
    <option value="Friday">Friday</option>
    <option value="Saturday">Saturday</option>
    <option value="Sunday">Sunday</option>
  </select>
</div>
      <div class="form-group mt-2">
        <label for="aadhar">Arrival time</label>
        <input type="time" class="form-control" name="arrival_time" id="arrival" placeholder="00:00">
      </div>
      <div class="form-group mt-2">
        <label for="aadhar">price</label>
        <input type="text" class="form-control" name="price" id="price" placeholder="Enter price">
      </div>
       <div class = "container">
			<button type="submit" class="btn btn-success border-none bg-[#9A616D] hover:bg-[#7a4c58] text-white">
  Submit
</button>
			
			
		</div>
      
    </div>
  </div>
</form>
  <table class="table mt-3">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Bus Number</th>
      <th scope="col">Seat Capacity</th>
      <th scope="col">Type of Bus</th>
      <th scope="col">Source</th>
      <th scope="col">Destination</th>
      <th scope="col">Stops</th>
      <th scope="col">Date (YYYY/MM/DD)</th>
      <th scope="col">Dept_day</th>
      <th scope="col">Departure Time</th>
       <th scope="col">arr_day</th>
      <th scope="col">Arrival Time</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${buses}" var="c">
    <tr>
        <th scope="col">${c.busno}</th>
        <td>${c.seat_capacity}</td>
        <td>${c.type}</td>
        <td>${c.source}</td>
        <td>${c.destination}</td>
        <td>${c.stops}</td>
        <td>${c.date}</td>
        <td>${c.dept_day}</td>
        <td>${c.dept_time}</td>
        <td>${c.arrival_day}</td>
        <td>${c.arrival_time}</td>
        <td>${c.price}</td>
    </tr>
</c:forEach>
  </tbody>
</table>
        </div>
        </div>
        
        
</body>
</html>