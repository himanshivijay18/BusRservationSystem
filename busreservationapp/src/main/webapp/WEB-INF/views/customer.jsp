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
                <li><a href="" class="flex items-center px-4 py-2 text-lg transition bg-white text-[#9A616D]"><i class="fa-duotone fa-solid fa-users mr-3"></i> Customer</a></li>
                <li><a href="bus" class="block px-4 py-2 text-lg transition hover:bg-white hover:text-[#9A616D]"><i class="fa-duotone fa-solid fa-bus mr-3"></i> Bus</a></li>
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
               <Strong><h2>New Customer Registration Form</i></h2></Strong>              
            </nav>
            <c:if test="${not empty customermsg}">
    <div class="alert alert-primary mt-2">
        ${customermsg}
    </div>
</c:if>
  <form action="customer" method="post" class="mt-3">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
    <!-- Left Column -->
    <div class="space-y-4">
      
      <div class="form-group mt-2">
        <label for="firstname">Firstname</label>
        <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter your firstname">
      </div>
      <div class="form-group mt-2">
        <label for="lastname">Lastname</label>
        <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Enter your lastname">
      </div>
      <div class="form-group mt-2">
        <label for="gender">Gender</label>
        <div class="mt-2">
          <div class="form-group form-check-inline">
            <label for="female">Female</label>
            <input class="form-check-input" type="radio" name="gender" id="female" value="female">
          </div>
          <div class="form-group form-check-inline">
            <label for="male">Male</label>
            <input class="form-check-input" type="radio" name="gender" id="male" value="male">
          </div>
        </div>
      </div>
      <div class="form-group mt-2">
        <label for="aadhar">Aadhar Number</label>
        <input type="text" class="form-control" name="aadhar" id="aadhar" placeholder="Enter your Aadhar number">
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
        <label for="dob">Date of Birth</label>
        <input type="date" class="form-control" name="dob" id="dob">
      </div>
      <div class="form-group mt-2">
        <label for="address">Address</label>
        <textarea class="form-control" name = "address" id="address" rows="3" placeholder="Enter your address"></textarea>
      </div>
      <div class="form-group mt-4">
        <label for="contact">Contact Number</label>
        <input type="text" class="form-control" name="contact" id="contact" placeholder="Enter your contact number">
      </div>
    </div>
  </div>
</form>
  <table class="table mt-3">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Firstname</th>
      <th scope="col">Lastname</th>
      <th scope="col">Gender</th>
      <th scope="col">Aadhar Number</th>
      <th scope="col">Date</th>
      <th scope="col">Address</th>
      <th scope="col">Contact Number</th>
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${customers}" var="c">
    <tr>
        <th scope="col">${c.id}</th>
        <td>${c.firstname}</td>
        <td>${c.lastname}</td>
        <td>${c.gender}</td>
        <td>${c.aadhar}</td>
        <td>${c.dob}</td>
        <td>${c.address}</td>
        <td>${c.contact}</td>
    </tr>
</c:forEach>
 	
  
   
  </tbody>
</table>
        </div>
        </div>
        
        
</body>
</html>