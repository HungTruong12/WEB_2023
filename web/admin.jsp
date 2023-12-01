<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.Validate"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Trang qu?n tr? n?i dung</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="/font/fontawesome-free-6.3.0-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .header h1 {
            margin: 0;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-left: 20px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
        }

        .content {
            display: flex;
            margin-top: 20px;
        }

        .sidebar {
            background-color: #e5e5e5;
            width: 200px;
            height: 500px;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            color: #333;
            text-decoration: none;
        }

        .main {
            flex: 1;
            padding: 20px;
        }

        .main h2 {
            margin-top: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: white;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        table td:nth-child(3){
            width: 50px;
        }

        table td:nth-child(2){
            width: auto;
        }

        table td:last-child{
            width: 250px;
        }

        table tr{
            height: 50px;
        }
    </style>
  </head>
  
  <body>
    <div class="header">
      <h1>Trang qu?n tr? n?i dung</h1>
      <nav>
        <ul>
          <li><a href="homeServlet">Trang ch?</a></li>
          <li><a href="http://localhost:3000/admin/create">??ng bài m?i</a></li>
          <li><a href="http://localhost:3000/admin/stored-main">N?i dung trang ch?</a></li>
          <li><a href="http://localhost:3000/admin/stored-c1">Bài báo Champion League</a></li>
          <li><a href="http://localhost:3000/admin/stored-euro">Bài báo Euro</a></li>
          <li><a href="http://localhost:3000/admin/stored-epl">Bài báo Epl</a></li>
          <li><a href="ProcessLogout">Sign out</a></li>

        </ul>
      </nav>
    </div>
        <div class="content">
          <div class="sidebar">
            <ul>
                <li style="margin-left: 12px;"><a href="admin?action=manage_product" class="manage_product" >Qu?n lý s?n ph?m</a></li>
                <li style="margin-left: 12px;"><a href="admin?action=manage_user" class="manage_user">Qu?n lý ng??i dùng</a></li>
                <li style="margin-left: 12px;"><a href="admin">Th?ng kê</a></li>
            </ul>
          </div>
          <div class="main">
            <a href="EditProduct?action=add_new_product">Thêm s?n ph?m</a> <br>
            
            <c:if test="${sessionScope.displayUser eq 'block'}">
                <form action="admin" method="get" style="padding-bottom: 10px">
                    <input type="hidden" name="action" value="search_user">
                    <input type="text" class="searcher" style="margin-top: 5px" name="name">
                    <input type="submit" value="search" id="submit">
                </form>
            </c:if>
            
            <c:if test="${sessionScope.displayProduct eq 'block'}">
                <form action="admin" method="get" style="padding-bottom: 10px">
                    <input type="hidden" name="action" value="search_product">
                    <input type="text" class="searcher" style="margin-top: 5px" name="name">
                    <input type="submit" value="search" id="submit">
                </form>
            </c:if>
            
            <table class="table" style="overflow: auto ;color: rgb(36, 38, 41); display: <%= Validate.StringUtil((String) session.getAttribute("displayUser")) %> ; ">
                <thead>
                    <tr >
                    <th scope="col" style="color: rgb(36, 38, 41);">Tên</th>
                    <th scope="col" style="color: rgb(36, 38, 41);">Email</th>
                    <th scope="col" style="color: rgb(36, 38, 41);">SDT</th>
                    <th style="color: rgb(36, 38, 41);">Ch?nh s?a</th>
                    </tr>
                </thead>
                <tbody>
                    <% ArrayList<User> ctvList = (ArrayList<User>) request.getAttribute("users"); 
                    int stt = 1; %> 
                    <% for(User x : ctvList) { 
                        if (!"admin".equals(x.getRole())) { %> 
                    <tr>
                    <th scope="row" style="color: black;"><%= x.getName() %> </th>
                    <td><%= x.getEmail() %></td>
                    <td ><%= x.getPhone() %></td>
                    <td>
                        <!--<a href="/c1/{{this._id}}/edit" class="btn btn-primary">S?a</a>-->
                        <a href="EditUser?action=Delete&email=<%= x.getEmail() %>" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delete-course-modal">Xóa</a>
                        <a href="/c1/{{this.slug}}" class="btn btn-primary">Xem bài vi?t</a>

                    </td>
                    </tr>
                    <% } 
                    } %>

                </tbody>
            </table> 
        
            <table class="table" style="color: rgb(36, 38, 41); display: <%= Validate.StringUtil((String) session.getAttribute("displayProduct")) %>; ">
                <thead>
                    <tr >
                    <th scope="col" style="color: rgb(36, 38, 41);">ID</th>
                    <th scope="col" style="color: rgb(36, 38, 41);">Name</th>
                    <th scope="col" style="color: rgb(36, 38, 41);">Price</th>
                    <th scope="col" style="color: rgb(36, 38, 41);">Type</th>
                    <th style="color: rgb(36, 38, 41);">Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${product}" var="product">
                        <c:set var="id" value="${product.id}"/>
                    <tr>
                        <th scope="row" style="color: black;">${product.id}</th>
                        <td>${product.name}</td>
                        <td >${product.price} VNÐ</td>
                        <td>${product.cate.name}</td>
                    <td>
                        <a href="EditProduct?action=Edit_product&id=${id}" class="btn btn-primary">Edit</a>
                        <a href="EditProduct?action=deleteProduct&id=${id}" class="btn btn-primary">Dele</a>
                        <a href="/c1/{{this.slug}}" class="btn btn-primary">View detail</a>

                    </td>
                    </tr>
                    </c:forEach>

                </tbody>
            </table> 
      </div>
    </div>

    <div class="footer">
      <p>© 2023</p>
    </div>

    <!-- confirm  delete -->
    <!--  -->

    <div id="delete-course-modal" class="modal" tabindex="-1">
      <div class="modal-dialog">
          <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Xác nh?n</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <p>B?n ch?c ch?n mu?n xóa bài vi?t này ?</p>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">H?y</button>
              <button id="btn-delete-c1" type="button" class="btn btn-danger">Xóa</button>
          </div>
          </div>
      </div>
    </div>

  </body>
</html>
