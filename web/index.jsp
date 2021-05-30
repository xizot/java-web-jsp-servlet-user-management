<%-- 
    Document   : index
    Created on : May 30, 2021, 5:00:33 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="dao.DataController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            User Management Application
        </header>
        <main>
            
            <div class="container">
                <h3 class="title">List of Users </h3>

              <!-- Button trigger modal -->
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                  Add new user
                </button>
                <!-- Add Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add new</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                          <form action="AddUser" method="post">

                            <div class="mb-3">
                              <label for="inputID" class="form-label">ID</label>
                              <input type="text" class="form-control" id="inputID" name="id" required>
                            </div>

                            <div class="mb-3">
                              <label for="inputName" class="form-label">Name</label>
                              <input type="text" class="form-control" id="inputName" name="name" required>
                            </div>

                            <div class="mb-3">
                              <label for="inputEmail" class="form-label">Email address</label>
                              <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" name="email" required>
                              <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>

                            <div class="mb-3">
                              <label for="inputCountry" class="form-label">Country</label>
                              <input type="text" class="form-control" id="inputCountry" name="country" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-add">Add user</button>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>

               
                <!-- Update Modal -->
                <div class="modal fade" id="updateModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update user</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                          <form action="UpdateUser" method="posts">

                                <div class="mb-3">
                                  <label for="putID" class="form-label">ID</label>
                                  <input type="text" class="form-control" id="putID" readonly="" name="putID">
                                </div>


                            <div class="mb-3">
                              <label for="putName" class="form-label">Name</label>
                              <input type="text" class="form-control" id="putName" name="putName">
                            </div>

                            <div class="mb-3">
                              <label for="putEmail" class="form-label">Email address</label>
                              <input type="email" class="form-control" id="putEmail" aria-describedby="emailHelp" name="putEmail">
                              <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>

                            <div class="mb-3">
                              <label for="putCountry" class="form-label">Country</label>
                              <input type="text" class="form-control" id="putCountry" name="putCountry">
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                          </form>
                      </div>
                    </div>
                  </div>
                </div>

                
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Country</th>
                        <th scope="col">Actions</th>
                      </tr>
                    </thead>
                    <tbody> 
                        <%
                          List<User> users = DataController.getAll();
                          for (User u : users) {
                        %>
                            <tr>
                              <th scope="row"><%= u.getId() %></th>
                              <td> <%= u.getName() %> </td>
                              <td> <%= u.getEmail() %> </td>
                              <td> <%= u.getCountry() %> </td>
                              <td>
                                  <div style="display:flex">

                                  <button style="margin-right: 10px" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModel" onclick="FillModal('<%= u.getId() %>','<%= u.getName() %>','<%= u.getEmail() %>','<%= u.getCountry()%>')">Edit</button>

                                  <form action="DeleteUser" method="post" class="form-delete">
                                      <input type="text" value="<%= u.getId() %>" style="display:none" name="id"/>

                                      <button type="submit" class="btn btn-danger btn-delete" >Delete</button>
                                  </form>
                                  </div>

                              </td>
                            </tr>
                        <%};%>
                      
                    </tbody>
                  </table>

            </div>

        </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script>
        
        function FillModal(id,name,email,country){
            document.getElementById("putID").value = id;          
            document.getElementById("putName").value = name; 
            document.getElementById("putEmail").value = email;
            document.getElementById("putCountry").value = country;

        }
        
       var form = document.querySelectorAll('.form-delete');
        for (let i = 0; i < form.length; i++) {
            form[i].addEventListener('submit', function(e) {

              e.preventDefault();
              var rs = confirm("Are you sure to delete this user? ");
              if(rs){
                  this.submit();
              }

            });
        }
           
    </script>
    </body>
</html>
