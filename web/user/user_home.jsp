<%-- 
    Document   : user_home
    Created on : Jun 9, 2023, 4:10:25 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="model.Food" %>
<%@page import="model.User" %>
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
        <style type="text/css">
            .form-label-left{
                width:150px;
            }
            .form-line{
                padding-top:12px;
                padding-bottom:12px;
            }
            .form-label-right{
                width:150px;
            }
            body, html{
                margin:0;
                padding:0;
                background:#fff;
            }

            .form-all{
                margin:0px auto;
                padding-top:0px;
                width:690px;
                color:#555 !important;
                font-family:"Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Verdana, sans-serif;
                font-size:14px;
            }
            .form-radio-item label, .form-checkbox-item label, .form-grading-label, .form-header{
                color: false;
            }

        </style>
        
        <style type="text/css" id="form-designer-style">
            /* Injected CSS Code */
            /*PREFERENCES STYLE*/
            .form-all {
                font-family: Lucida Grande, Lucida Sans Unicode, Lucida Sans, Verdana, Tahoma, sans-serif, sans-serif;
            }



            .form-line {
                margin-top: 12px 36px 12px 36px px;
                margin-bottom: 12px 36px 12px 36px px;
                padding-top: 0;
                padding-bottom: 0;
            }

            .form-all {
                max-width: 690px;
                width: 100%;
            }

            .form-label.form-label-left,
            .form-label.form-label-right,
            .form-label.form-label-left.form-label-auto,
            .form-label.form-label-right.form-label-auto {
                width: 150px;
            }

            .form-all {
                font-size: 14pxpx
            }

            .supernova .form-all, .form-all {
                background-color: none;
            }

            .form-all {
                color: #555;
            }
            .form-header-group .form-header {
                color: #555;
            }
            .form-header-group .form-subHeader {
                color: #555;
            }
            .form-label-top,
            .form-label-left,
            .form-label-right,
            .form-html,
            .form-checkbox-item label,
            .form-radio-item label,
            span.FITB .qb-checkbox-label,
            span.FITB .qb-radiobox-label,
            span.FITB .form-radio label,
            span.FITB .form-checkbox label,
            [data-blotid][data-type=checkbox] [data-labelid],
            [data-blotid][data-type=radiobox] [data-labelid],
            span.FITB-inptCont[data-type=checkbox] label,
            span.FITB-inptCont[data-type=radiobox] label {
                color: #555;
            }
            .form-sub-label {
                color: #6f6f6f;
            }

            .supernova {
                background-color: undefined;
            }
            .supernova body {
                background: transparent;
            }

            .form-textbox,
            .form-textarea,
            .form-dropdown,
            .form-radio-other-input,
            .form-checkbox-other-input,
            .form-captcha input,
            .form-spinner input {
                background-color: undefined;
            }

            .supernova {
                background-image: none;
            }
            #stage {
                background-image: none;
            }
            ;

            .form-all {
                background-image: none;
            }
            .form-all:before {
                content: none;
            }
            .form-all {
                margin-top: 0px;
            }/*PREFERENCES STYLE*//*__INSPECT_SEPERATOR__*/
            .form-label.form-label-auto {

                display: inline-block;
                float: left;
                text-align: left;

            }
            /* Injected CSS Code */
        </style>
        
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
            
            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }

        </style>
        
        <link href="https://cdn01.jotfor.ms/static/formCss.css?3.3.42968" rel="stylesheet" type="text/css" />
<style type="text/css">@media print{.form-section{display:inline!important}.form-pagebreak{display:none!important}.form-section-closed{height:auto!important}.page-section{position:initial!important}}</style>
<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/nova.css?3.3.42968" />
<link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/themes/CSS/566a91c2977cdfcd478b4567.css?v=3.3.42968&themeRevisionID=642aed92326239083fe53f08"/>
<link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/css/styles/payment/payment_feature.css?3.3.42968" />
<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/stylebuilder/donationBox.css?v=3.3.42968">
<style type="text/css">
    .form-label-left{
        width:150px;
    }
    .form-line{
        padding-top:12px;
        padding-bottom:12px;
    }
    .form-label-right{
        width:150px;
    }
    body, html{
        margin:0;
        padding:0;
        background:#fff;
    }

    .form-all{
        margin:0px auto;
        padding-top:20px;
        width:690px;
        color:#555 !important;
        font-family:"Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Verdana, sans-serif;
        font-size:14px;
    }
    .form-radio-item label, .form-checkbox-item label, .form-grading-label, .form-header{
        color: false;
    }

</style>

<style type="text/css" id="form-designer-style">
    /* Injected CSS Code */
/*PREFERENCES STYLE*/
    .form-all {
      font-family: Lucida Grande, Lucida Sans Unicode, Lucida Sans, Verdana, Tahoma, sans-serif, sans-serif;
    }
  
    
  
    .form-line {
      margin-top: 12px 36px 12px 36px px;
      margin-bottom: 12px 36px 12px 36px px;
      padding-top: 0;
      padding-bottom: 0;
    }
  
    .form-all {
      max-width: 690px;
      width: 100%;
    }
  
    .form-label.form-label-left,
    .form-label.form-label-right,
    .form-label.form-label-left.form-label-auto,
    .form-label.form-label-right.form-label-auto {
      width: 150px;
    }
  
    .form-all {
      font-size: 14pxpx
    }
  
    .supernova .form-all, .form-all {
      background-color: none;
    }
  
    .form-all {
      color: #555;
    }
    .form-header-group .form-header {
      color: #555;
    }
    .form-header-group .form-subHeader {
      color: #555;
    }
    .form-label-top,
    .form-label-left,
    .form-label-right,
    .form-html,
    .form-checkbox-item label,
    .form-radio-item label,
    span.FITB .qb-checkbox-label,
    span.FITB .qb-radiobox-label,
    span.FITB .form-radio label,
    span.FITB .form-checkbox label,
    [data-blotid][data-type=checkbox] [data-labelid],
    [data-blotid][data-type=radiobox] [data-labelid],
    span.FITB-inptCont[data-type=checkbox] label,
    span.FITB-inptCont[data-type=radiobox] label {
      color: #555;
    }
    .form-sub-label {
      color: #6f6f6f;
    }
  
  .supernova {
    background-color: undefined;
  }
  .supernova body {
    background: transparent;
  }
  
    .form-textbox,
    .form-textarea,
    .form-dropdown,
    .form-radio-other-input,
    .form-checkbox-other-input,
    .form-captcha input,
    .form-spinner input {
      background-color: undefined;
    }
  
    .supernova {
      background-image: none;
    }
    #stage {
      background-image: none;
    };
  
    .form-all {
      background-image: none;
    }
  .form-all:before { content: none; } .form-all { margin-top: 0px; }/*PREFERENCES STYLE*//*__INSPECT_SEPERATOR__*/
.form-label.form-label-auto {
        
        display: inline-block;
        float: left;
        text-align: left;
      
      }
    /* Injected CSS Code */
</style>

<script src="https://cdn03.jotfor.ms/static/prototype.forms.js?3.3.42968" type="text/javascript"></script>
<script src="https://cdn01.jotfor.ms/static/jotform.forms.js?3.3.42968" type="text/javascript"></script>
<script src="https://cdn02.jotfor.ms/js/payments/validategateways.js?v=3.3.42968" type="text/javascript"></script>
<script type="text/javascript">	JotForm.newDefaultTheme = false;
	JotForm.extendsNewTheme = false;
	JotForm.singleProduct = true;
	JotForm.newPaymentUIForNewCreatedForms = false;
	JotForm.submitError="jumpToFirstError";

	JotForm.init(function(){
	/*INIT-START*/
      JotForm.alterTexts({"couponApply":"Apply","couponBlank":"Please enter a coupon.","couponChange":"","couponEnter":"Enter coupon","couponExpired":"Coupon is expired. Please try another one.","couponInvalid":"Coupon is invalid.","couponValid":"Coupon is valid.","shippingShipping":"Shipping","taxTax":"Tax","totalSubtotal":"Subtotal","totalTotal":"Total"}, true);
	/*INIT-END*/
	});

   JotForm.prepareCalculationsOnTheFly([null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,{"description":"","name":"filters","qid":"37","subLabel":"","text":"Filters","type":"control_dropdown"}]);
   setTimeout(function() {
JotForm.paymentExtrasOnTheFly([null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,{"description":"","name":"filters","qid":"37","subLabel":"","text":"Filters","type":"control_dropdown"}]);}, 20); 
</script>
        <%
                    User user= (User) request.getAttribute("user");
                    Vector<Food> vector= (Vector<Food>) request.getAttribute("foods");
                    Vector<String> category= (Vector<String>) request.getAttribute("category");
                    String message= (String) request.getAttribute("message");
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
                            <a class="nav-link active" aria-current="page" href="/FoodController?username=<%=user.getUsername()%>">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/CartController?action=viewCart&cusID=<%=user.getUserID()%>">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/OrderController?action=viewOrder&cusID=<%=user.getUserID()%>">Order History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/OrderController?action=viewUserAcceptedOrder&cusID=<%=user.getUserID()%>">Accepted Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/OrderController?action=viewUserServedOrder&cusID=<%=user.getUserID()%>">Served Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/UserController?action=viewProfile&cusID=<%=user.getUserID()%>">My Profile</a>
                        </li>
                        
                    </ul>
                    <form method="get" action="/FoodController" class="d-flex">
                        <input type="hidden" name="action" value="search">
                        <input type="hidden" name="username" value="<%=user.getUsername()%>">
                        <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">List of Food</h2>
				</div>
			</div>
                    <article style="color: red"><%=message!= null? message: ""%></article>

                        
                        <form class="jotform-form" action="/FoodController" method="Get" accept-charset="utf-8" autocomplete="on">
                            <input type="hidden" name="username" value="<%=user.getUsername()%>">
                            <input type="hidden" name="action" value="viewByCate">
                            <div role="main" class="form-all">
                                <ul class="form-section page-section">
                                    <li class="form-line" data-type="control_dropdown" id="id_37"><label class="form-label form-label-left form-label-auto" id="label_37" for="input_37"> Filters </label>
                                        <div id="cid_37" class="form-input"> <select onchange="this.form.submit()" class="form-dropdown" id="input_37" name="category" style="width:150px" data-component="dropdown" aria-label="Filters">
                                                <option disabled="">Category</option>
                                                <%for(String s: category){%>
                                                    <option value="<%=s%>"><%=s%></option>
                                                <%}%>
                                            </select> </div>
                                    </li>
                                </ul>
                            </div>
                            <script>
                              JotForm.showJotFormPowered = "new_footer";
                            </script>
                            <script>
                              JotForm.poweredByText = "Powered by Jotform";
                            </script>
                            <script type="text/javascript">
                              var all_spc = document.querySelectorAll("form[id='231612482725454'] .si" + "mple" + "_spc");
                              for (var i = 0; i < all_spc.length; i++)
                              {
                                all_spc[i].value = "231612482725454-231612482725454";
                              }
                            </script>
                        </form>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-striped">
						  <thead>
						    <tr>
						      <th></th>
						      <th>Name</th>
                                                      <th>Category</th>
						      <th>Brand</th>
						      <th>Price</th>
                                                      <th></th>
						    </tr>
						  </thead>
                                                  <%for(Food f: vector){%>
						  <tbody>
						    <tr>
                                                        <th scope="row"><%=i++%></th>
						      <td><%=f.getFoodName()%></td>
						      <td><%=f.getCategoryName()%></td>
						      <td><%=f.getBrandName()%></td>
						      <td><%=f.getPrice()%></td>
                                                      <td><a style="font-size:24px;text-decoration: none" href="/CartController?action=addToCart&username=<%=user.getUsername()%>&foodID=<%=f.getFoodID()%>" class="fa fa-shopping-cart"></a></td>
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
    <script type="text/javascript">JotForm.ownerView=true;</script>
    </body>
    

</html>
