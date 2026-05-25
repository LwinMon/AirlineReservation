<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
    <jsp:include page="navbar.html"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Review Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }
    .container2 {
      width: 80%;
      margin: 20px auto;
      background-image:url('cloud11.jpg');
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    span{
	  
    color:white;
    text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
  }
    h2 {
      margin-top: 0;
    }
    #userName{
    width: 100%;
      font-size: 15px;
      margin-bottom: 10px;
      background:transparent;
     border:none;
     outline:none;
     border-bottom:1px solid gray;
    }
    #reviewInput {
      width: 100%;
      font-size: 15px;
      margin-bottom: 10px;
      background:transparent;
     border:none;
     outline:none;
     border-bottom:1px solid gray;
    }
    #submitBtn {
      background-color:  rgb(0, 128, 190);
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    #submitBtn:hover {
      background-color:  rgb(0, 114, 192);
    }
    #comments {
      margin-top: 20px;
    }
    .comment {
      border-bottom: 1px solid #ccc;
      padding: 10px 0;
      display: flex;
      align-items: center;
    }
    .profile-img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 10px;
      background-color: #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
    }
    .profile-img img {
      display: none;
    }
    .profile-img span {
      color: #555;
    }
    .comment p {
      margin: 0;
    }
  </style>
</head>
<body>

<div class="container2">
  <h2><span>Leave a Review</span></h2><br>
  <input type="text" id="userName" placeholder="Your Name..." required maxlength="20" size="20">
  <textarea id="reviewInput" placeholder="Write your review here..."></textarea>
  <button id="submitBtn">Submit Review</button>

  <div id="comments">
    <!-- Comments will be added here dynamically -->
  </div>
</div>

<script>
  document.getElementById('submitBtn').addEventListener('click', function() {
    var userName = document.getElementById('userName').value;
    var review = document.getElementById('reviewInput').value;
    if(userName.trim() !== '' && review.trim() !== '') {
      var commentDiv = document.createElement('div');
      commentDiv.classList.add('comment');
      
      var profileImg = document.createElement('div');
      profileImg.classList.add('profile-img');
      var profileInitial = document.createElement('span');
      profileInitial.textContent = userName.charAt(0).toUpperCase();
      profileImg.appendChild(profileInitial);
      commentDiv.appendChild(profileImg);
      
      var commentPara = document.createElement('p');
      commentPara.textContent = review;
      var userNamePara = document.createElement('p');
      userNamePara.textContent = userName;
      commentDiv.appendChild(userNamePara);
      commentDiv.appendChild(commentPara);
      document.getElementById('comments').appendChild(commentDiv);
      document.getElementById('userName').value = '';
      document.getElementById('reviewInput').value = '';
    }
  });
</script>

</body>
</html>


