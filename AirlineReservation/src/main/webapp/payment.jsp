<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
<jsp:include page="navbar.html"/>
<!DOCTYPE html>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<head>
    <meta charset="UTF-8">
    <title>Airline Payment Form</title>
    <style>
        button #image{
            width:80px;
        }
        #aya{
            border-radius:10px;
        }
        body {
            font-family: Arial, sans-serif;
            background-image:url('cloud11.jpg');
            background-repeat:no-repeat;
            background-size:cover;
            display:block;
            margin: 0;
            padding: 0;
        }
        #paycontainer {
            width: 60%;
            margin: 50px auto;
            padding: 80px;
            border-radius: 5px;
            background:transparent;
            backdrop-filter:blur(20px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.5);
            margin-bottom:100px;
            border-radius:20px;
        }
        span{
            font-size: 40px;
            color:white;
            text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border:none;
            background:transparent;
            border-bottom:1px solid gray;
        }
        #payNow{
            background-color: rgb(0, 128, 192);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        #payNow:hover {
            background-color: rgb(0,128,220);
        }
         .card {
            display: none;
            position: fixed;
            width:50%;
            top: 32%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            padding-bottom:0px;
            background-color:white;
            border:none;
            z-index: 9999;
            box-shadow: 0 0 0 1000px rgba(0,0,0,0.3);
        }
        button:hover{
            box-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
        }
        .totamount{
            display:inline-block;

        }

    </style>
</head>
<body>
    <div id="paycontainer">
        <form id="myForm4" action="" method="post">

            <h3 class="text-danger">Your payment will be cost</h3><br><br>
            <% 

            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Establishing database connection
                con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

             // Assuming uname is the session attribute that identifies the user
                String idnum = (String) session.getAttribute("id");
                String sql = "SELECT * FROM booking WHERE idnumber = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, idnum);
                rs = pstmt.executeQuery();

                int totalAmount = 0;
                int ticketQuantity=0;
                String cabinClass = "";

                while (rs.next()) {
                    ticketQuantity = rs.getInt("ticket");
                    cabinClass = rs.getString("class");

                    if ("Economy Class".equalsIgnoreCase(cabinClass)) {
                        totalAmount += rs.getInt("ticket") * 100;
                    } else if ("Business Class".equalsIgnoreCase(cabinClass)) {
                        totalAmount += rs.getInt("ticket") * 200;
                    } else if ("First Class".equalsIgnoreCase(cabinClass)) {
                        totalAmount += rs.getInt("ticket") * 300;
                    }

                }

                %>

                <div class='totamount fs-5'>Total Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <strong class="text-success fs-5">$<%= totalAmount %></strong>
                <br><br><br><hr>

                <h3 class="text-danger">Pay it with</h3><br><br>
                <div class="d-flex flex-row justify-content-evenly">
                <button type="button" name="paymethod" value="Paypal" class="p-0 border-0 bg-transparent" onclick="showCard('Paypal')"><img id="image" src="paypal.png"></button>
                <button type="button" name="paymethod" value="KBZ" class="p-0 border-0 bg-transparent" onclick="showCard('KBZ')"><img id="image" src="kbz.png"></button>
                </div>
                <br>
                <div class="d-flex flex-row justify-content-evenly">
                <button type="button" name="paymethod" value="AYA" class="p-0 border-0 bg-transparent" onclick="showCard('AYA')"><img id="image" src="aya2.png"></button>
                <button type="button" name="paymethod" value="Master Card" class="p-0 border-0 bg-transparent" onclick="showCard('Master Card')"><img id="image" src="master.gif"></button>
                </div>

                <div class="card p-5" id="card">
                    <h3 class="text-danger">Price Details(USD)</h3>
                    <hr>
                    <div class="card-body d-flex flex-row justify-content-evenly">
                        <div>
                            Ticket Quantity :<br><br>
                            Price Per Ticket : <br><br><hr>
                            Total Price:<br><br>
                            Payment Method: <br><br>
                        </div>
                        <div class="text-danger">
                        <%= ticketQuantity %><br><br>
                        <%= (cabinClass.equals("Economy Class") ? "$100" : cabinClass.equals("Business Class") ? "$200" : "$300") %><br><br><hr>
                         $<%= totalAmount %><br><br>
                         <div id="method"></div><br><br>
                        </div>
                    </div>
                    <button id="regbutton" type="button" onclick="hideCard()">OK</button><br><br>
                    <p class="text-success float-end"> Thank you!<br>Have a safe flight.</p>
                </div>

                <%   

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Closing resources
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %><br><br>


        </form>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

   <script>


   function showCard(method) {
        var card = document.getElementById("card");
        card.style.display = "block";
        document.getElementById("method").innerHTML = method;
    }


function hideCard() {
  var card = document.getElementById("card");
  card.style.display = "none";
}

</script>
</body>
</html>
