<%-- 
    Document   : user_home
    Created on : Jun 9, 2023, 4:10:25 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="model.Order" %>
<%@page import="model.User" %>
<%@page import="controller.Order_FoodController" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .fa-cart-plus{
                background:#0652DD;
            }

            .addtocart{
                display:block;
                padding:0.5em 1em 0.5em 1em;
                border-radius:100px;
                border:none;
                font-size:15px;
                position:relative;
                background:#0652DD;
                cursor:pointer;
                height:2em;
                width:10em;
                overflow:hidden;
                transition:transform 0.1s;
                z-index:1;
            }
            .addtocart:hover{
                transform:scale(1.1);
            }
            .pretext{
                color:#fff;
                background:#0652DD;
                position:absolute;
                top:0;
                left:0;
                height:100%;
                width:100%;
                display:flex;
                justify-content:center;
                align-items:center;
                font-family: 'Quicksand', sans-serif;
            }
            i{
                margin-right:10px;
            }
            .done{
                background:#be2edd;
                position:absolute;
                width:100%;
                top:0;
                left:0;
                transition:transform 0.3s ease;

                transform:translate(-110%) skew(-40deg);
            }
            .posttext{
                background:#be2edd;
            }
            .fa-check{
                background:#be2edd;
            }

        </style>
        <%
                    User user= (User) request.getAttribute("user");
                    Vector<Order> vector= (Vector<Order>) request.getAttribute("orders");
                    Order_FoodController ofc= (Order_FoodController) request.getAttribute("orderFoodController");
                    int index= vector.size();
                    int i=1;
        %>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/FoodController?username=<%=user.getUsername()%>"><%=user.getUsername()%></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/FoodController?username=<%=user.getUsername()%>">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CartController?action=viewCart&cusID=<%=user.getUserID()%>">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" class="nav-link" href="/OrderController?action=viewOrder&cusID=<%=user.getUserID()%>">Order History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/OrderController?action=viewUserAcceptedOrder&cusID=<%=user.getUserID()%>">Accepted Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/OrderController?action=viewUserServedOrder&cusID=<%=user.getUserID()%>">Served Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/UserController?action=viewProfile&cusID=<%=user.getUserID()%>">My Profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Served Orders</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-striped">
						  <thead>
						    <tr>
						      <th></th>
						      <th>Order Date</th>
                                                      <th>Serve Date</th>
						      <th>Order Status</th>
						      <th>Quantity Food</th>
                                                      <th>Total Price</th>
                                                      <th></th>
						    </tr>
						  </thead>
                                                  <%for(Order dto: vector){%>
						  <tbody>
						    <tr>
                                                        <th scope="row"><%=i++%></th>
						      <td><%=dto.getOrderDate()%></td>
						      <td><%=dto.getServeDate()%></td>
						      <td><%=dto.getOrderStatus()%></td>
						      <td><%=ofc.findQuantityFoodByOrderDate(dto.getOrderDate())%></td>
                                                      <td><%=dto.getTotalPrice()%></td>
                                                      <td><a style="font-size:24px;text-decoration: none" href="/Order_FoodController?action=viewOrderDetail&username=<%=user.getUsername()%>&orderID=<%=dto.getOrderID()%>" class="fa fa-info-circle"></a></td>
                                                      
						    </tr>
						  </tbody>
                                                  <% }%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
                                               
<script>
const button = document.querySelector(".addtocart");
const done = document.querySelector(".done");
console.log(button);
let added = false;
button.addEventListener('click',()=>{
  if(added){
    done.style.transform = "translate(-110%) skew(-40deg)";
    added = false;
  }
  else{
    done.style.transform = "translate(0px)";
    added = true;
  }
    
});
</script>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
    

</html>
