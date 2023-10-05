<%-- 
    Document   : add_to_cart
    Created on : Jun 11, 2023, 7:35:43 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Food" %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to Cart</title>
        <link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F231612482725454" title="oEmbed Form">
        <link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F231612482725454" title="oEmbed Form">
        <meta property="og:title" content="Add to Cart Form" >
        <meta property="og:url" content="https://form.jotform.com/231612482725454" >
        <meta property="og:description" content="Please click the link to complete this form." >
        <meta name="slack-app-id" content="AHNMASS8M">
        <meta property="og:image" content="https://cdn.jotfor.ms/assets/img/landing/opengraph.png" />
        <link rel="shortcut icon" href="https://cdn.jotfor.ms/assets/img/favicons/favicon-2021-light%402x.png">
        <script>
                  var favicon = document.querySelector('link[rel="shortcut icon"]');
                  window.isDarkMode = (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches);
                  if(favicon && window.isDarkMode) {
                      favicon.href = favicon.href.replaceAll('favicon-2021-light%402x.png', 'favicon-2021-dark%402x.png');
            }
        </script><link rel="canonical" href="https://form.jotform.com/231612482725454" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=1" />
        <meta name="HandheldFriendly" content="true" />
        <title>Add to Cart Form</title>
        <link href="https://cdn01.jotfor.ms/static/formCss.css?3.3.42650" rel="stylesheet" type="text/css" />
        <style type="text/css">@media print{
.form-section{
display:inline!important
}
.form-pagebreak{
display:none!important
}
.form-section-closed{
height:auto!important
}
.page-section{
position:initial!important
}
}</style>
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/nova.css?3.3.42650" />
        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/themes/CSS/566a91c2977cdfcd478b4567.css?v=3.3.42650&themeRevisionID=642aed92326239083fe53f08"/>
        <link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/css/styles/payment/payment_feature.css?3.3.42650" />
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
              background-color: none ;
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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/buttons/form-submit-button-simple_blue.css?3.3.42650"/>
        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/buttons/form-submit-button-simple_grey.css?3.3.42650"/>
        <script src="https://cdn01.jotfor.ms/static/prototype.forms.js?3.3.42650" type="text/javascript"></script>
        <script src="https://cdn02.jotfor.ms/static/jotform.forms.js?3.3.42650" type="text/javascript"></script>
        <script src="https://cdn03.jotfor.ms/js/payments/validategateways.js?v=3.3.42650" type="text/javascript"></script>
        <script type="text/javascript">	JotForm.newDefaultTheme = false;
            JotForm.extendsNewTheme = false;
            JotForm.singleProduct = false;
            JotForm.newPaymentUIForNewCreatedForms = false;
            JotForm.submitError = "jumpToFirstError";

            JotForm.init(function () {
                /*INIT-START*/
                if (window.JotForm && JotForm.accessible)
                    $('input_11').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_4').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_15').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_12').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_6').setAttribute('tabindex', 0);
                /*INIT-END*/
            });

            JotForm.prepareCalculationsOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Add Product to Cart", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Add to cart", "type": "control_button"}, null, {"name": "productName", "qid": "4", "text": "Product Name", "type": "control_textbox"}, null, {"name": "additionalDescription", "qid": "6", "text": "Additional Description", "type": "control_textarea"}, null, {"name": "price", "qid": "8", "text": "Price", "type": "control_number"}, null, null, {"description": "", "name": "productId", "qid": "11", "subLabel": "", "text": "Product ID", "type": "control_textbox"}, {"description": "", "name": "brand", "qid": "12", "subLabel": "", "text": "Brand", "type": "control_textbox"}, {"name": "addProduct", "qid": "13", "text": "Back", "type": "control_button"}, null, {"description": "", "name": "category15", "qid": "15", "subLabel": "", "text": "Category", "type": "control_textbox"}, {"description": "", "name": "quantity", "qid": "16", "subLabel": "", "text": "Quantity", "type": "control_number"}]);
            setTimeout(function () {
                JotForm.paymentExtrasOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Add Product to Cart", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Add to cart", "type": "control_button"}, null, {"name": "productName", "qid": "4", "text": "Product Name", "type": "control_textbox"}, null, {"name": "additionalDescription", "qid": "6", "text": "Additional Description", "type": "control_textarea"}, null, {"name": "price", "qid": "8", "text": "Price", "type": "control_number"}, null, null, {"description": "", "name": "productId", "qid": "11", "subLabel": "", "text": "Product ID", "type": "control_textbox"}, {"description": "", "name": "brand", "qid": "12", "subLabel": "", "text": "Brand", "type": "control_textbox"}, {"name": "addProduct", "qid": "13", "text": "Back", "type": "control_button"}, null, {"description": "", "name": "category15", "qid": "15", "subLabel": "", "text": "Category", "type": "control_textbox"}, {"description": "", "name": "quantity", "qid": "16", "subLabel": "", "text": "Quantity", "type": "control_number"}]);
            }, 20);
        </script>
    </head>
    <body>
        <%
            Food food= (Food) request.getAttribute("food");
            String message= (String) request.getAttribute("message");
            User user= (User) request.getAttribute("user");
            int quantity= (int) request.getAttribute("stock");
        %>
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
                        <li>
                            <a class="nav-link active" href="/FoodController?action=myFood&cusID=<%=user.getUserID()%>">My Food</a>
                        </li>
                        <li>
                            <a class="nav-link" href="/OrderController?action=viewOrder&cusID=<%=user.getUserID()%>">Order List</a>
                        </li>
                        <li>
                            <a class="nav-link" href="/OrderController?action=viewAcceptedOrder&cusID=<%=user.getUserID()%>">Accepted Orders</a>
                        </li>
                        <li>
                            <a class="nav-link" href="/OrderController?action=viewSubmittedOrder&cusID=<%=user.getUserID()%>">Submitted Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/UserController?action=viewProfile&cusID=<%=user.getUserID()%>">My Profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
            <div role="main" class="form-all">
                <ul class="form-section page-section">
                    <li id="cid_1" class="form-input-wide" data-type="control_head">
                        <div class="form-header-group  header-large">
                            <div class="header-text httac htvam">
                                <h1 id="header_1" class="form-header" data-component="header">Food Detail</h1>
                            </div>
                        </div>
                    </li>
                    <article style="color: red"><%=message!= null? message: ""%></article>
                    <input type="hidden" name="userID" value="<%=user.getUserID()%>">
                    <input type="hidden" name="foodID" value="<%=food.getFoodID()%>">
                    <li class="form-line" data-type="control_textbox" id="id_11"><label class="form-label form-label-left form-label-auto" id="label_11" for="input_11"> Food ID </label>
                        <div id="cid_11" class="form-input"><%=food.getFoodID()%> </div>
                    </li>
                    <li class="form-line" data-type="control_textbox" id="id_4"><label class="form-label form-label-left form-label-auto" id="label_4" for="input_4"> Food Name </label>
                        <div id="cid_4" class="form-input"> <%=food.getFoodName()%> </div>
                    </li>
                    <li class="form-line" data-type="control_textbox" id="id_15"><label class="form-label form-label-left form-label-auto" id="label_15" for="input_15"> Category </label>
                        <div id="cid_15" class="form-input"> <%=food.getCategoryName()%> </div>
                    </li>
                    <li class="form-line" data-type="control_textbox" id="id_12"><label class="form-label form-label-left form-label-auto" id="label_12" for="input_12"> Brand </label>
                        <div id="cid_12" class="form-input"> <%=food.getBrandName()%> </div>
                    </li>
                    
                    <li class="form-line" data-type="control_number" id="id_8"><label class="form-label form-label-left form-label-auto" id="label_8" for="input_8"> Price </label>
                        <div id="cid_8" class="form-input"> <%=food.getPrice()%> </div>
                    </li>
                    <li class="form-line" data-type="control_number" id="id_16"><label class="form-label form-label-left form-label-auto" id="label_16" for="input_16"> Quantity </label>
                        <div id="cid_16" class="form-input"><%=quantity%></div>
                    </li>
                    <li class="form-line" data-type="control_textarea" id="id_6"><label class="form-label form-label-left form-label-auto" id="label_6" for="input_6"> Additional Description </label>
                        <div id="cid_6" class="form-input"><%=food.getDescription()!= null?food.getDescription(): ""%> </div>
                    </li>
                    <li class="form-line" data-type="control_button" id="id_2">
                        <div id="cid_2" class="form-input-wide">
                            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_2" type="button" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content=""><a style="text-decoration: none;color: white" href="/FoodController?action=showEditForm&foodID=<%=food.getFoodID()%>&cusID=<%=user.getUserID()%>">Update</a></button><span> </span><button type="button" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button"><a style="text-decoration: none;color: white" href="/FoodController?action=showDeleteFood&foodID=<%=food.getFoodID()%>&cusID=<%=user.getUserID()%>">Delete</a></button></div>
                        </div>
                    </li>
                </ul>
            </div>
            <script>
              JotForm.showJotFormPowered = "new_footer";
            </script>
            <script>
              JotForm.poweredByText = "Powered by Jotform";
            </script><input type="hidden" class="simple_spc" id="simple_spc" name="simple_spc" value="231612482725454" />
            <script type="text/javascript">
              var all_spc = document.querySelectorAll("form[id='231612482725454'] .si" + "mple" + "_spc");
              for (var i = 0; i < all_spc.length; i++)
              {
                all_spc[i].value = "231612482725454-231612482725454";
              }
            </script>        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script type="text/javascript">JotForm.ownerView=true;</script>
    </body>
</html>
