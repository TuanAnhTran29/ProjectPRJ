<%-- 
    Document   : user_cart
    Created on : Jun 11, 2023, 11:14:23 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="model.Food" %>
<%@page import="model.Cart" %>
<%@page import="model.User" %>
<%@page import="controller.CartController" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/buttons/form-submit-button-simple_blue.css?3.3.42650"/>
        <script src="https://cdn03.jotfor.ms/static/prototype.forms.js?3.3.42650" type="text/javascript"></script>
        <script src="https://cdn01.jotfor.ms/static/jotform.forms.js?3.3.42650" type="text/javascript"></script>
        <script src="https://cdn02.jotfor.ms/js/payments/validategateways.js?v=3.3.42650" type="text/javascript"></script>
        <script type="text/javascript">	JotForm.newDefaultTheme = false;
            JotForm.extendsNewTheme = false;
            JotForm.singleProduct = true;
            JotForm.newPaymentUIForNewCreatedForms = false;
            JotForm.submitError = "jumpToFirstError";

            JotForm.init(function () {
                /*INIT-START*/
                productID = {"0": "input_18_1000"};
                paymentType = "product";
                JotForm.setCurrencyFormat('USD', true, 'point');
                JotForm.totalCounter({"input_18_1000": {"price": "10", "quantityField": "input_18_quantity_1000_0"}});
                $$('.form-product-custom_quantity').each(function (el, i) {
                    el.observe('blur', function () {
                        isNaN(this.value) || this.value < 1 ? this.value = '0' : this.value = parseInt(this.value)
                    })
                });
                $$('.form-product-custom_quantity').each(function (el, i) {
                    el.observe('focus', function () {
                        this.value == 0 ? this.value = '' : this.value
                    })
                });
                JotForm.handleProductLightbox();
                JotForm.alterTexts({"couponApply": "Apply", "couponBlank": "Please enter a coupon.", "couponChange": "", "couponEnter": "Enter coupon", "couponExpired": "Coupon is expired. Please try another one.", "couponInvalid": "Coupon is invalid.", "couponValid": "Coupon is valid.", "shippingShipping": "Shipping", "taxTax": "Tax", "totalSubtotal": "Subtotal", "totalTotal": "Total"}, true);
                /*INIT-END*/
            });

            JotForm.prepareCalculationsOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Add Product to Cart", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Buy", "type": "control_button"}, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"description": "", "name": "myProducts", "qid": "18", "text": "My Products", "type": "control_payment"}]);
            setTimeout(function () {
                JotForm.paymentExtrasOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Add Product to Cart", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Buy", "type": "control_button"}, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"description": "", "name": "myProducts", "qid": "18", "text": "My Products", "type": "control_payment"}]);
            }, 20);
        </script>
    </head>
    <body>
        <%
                    User user= (User) request.getAttribute("user");
                    Vector<Food> vector= (Vector<Food>) request.getAttribute("foods");
                    Vector<Cart> carts= (Vector<Cart>) request.getAttribute("carts");
                    CartController cartController= (CartController) request.getAttribute("cartController");
                    String message= (String) request.getAttribute("message");
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
                        <li class="nav-item">
                            <a class="nav-link active" class="nav-link" href="/CartController?action=viewCart&cusID=<%=user.getUserID()%>">Cart</a>
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
                </div>
            </div>
        </nav>
                 
                        <form class="jotform-form" action="/CartController?action=addOrder" method="post" name="form_231612482725454" id="231612482725454" accept-charset="utf-8" autocomplete="on"><input type="hidden" name="formID" value="231612482725454" /><input type="hidden" id="JWTContainer" value="" /><input type="hidden" id="cardinalOrderNumber" value="" />
                            <input type="hidden" name="cusID" value="<%=user.getUserID()%>">
                            <div role="main" class="form-all">
                                <ul class="form-section page-section">
                                    <li id="cid_1" class="form-input-wide" data-type="control_head">
                                        <div class="form-header-group  header-large">
                                            <div class="header-text httac htvam">
                                                <h1 id="header_1" class="form-header" data-component="header">Cart</h1>
                                            </div>
                                        </div>
                                    </li>
                                    <article style="color: red"><%=message!= null? message: ""%></article>
                                    <li class="form-line" data-type="control_payment" id="id_18" data-payment="true"><label class="form-label form-label-left form-label-auto" id="label_18" for="input_18"> My Foods </label>
                                        <div id="cid_18" class="form-input">
                                            <div data-wrapper-react="true">
                                                <div data-wrapper-react="true" class="product-container-wrapper">
                                                    <div class="filter-container"></div><input type="hidden" name="simple_fpc" data-payment_type="payment" data-component="payment1" value="18" /><input type="hidden" name="payment_transaction_uuid" id="paymentTransactionId" /><input type="hidden" name="payment_total_checksum" id="payment_total_checksum" data-component="payment2" />
                                                    <div id="image-overlay" class="overlay-content" style="display:none"><img id="current-image" /><span class="lb-prev-button">prev</span><span class="lb-next-button">next</span><span class="lb-close-button">( X )</span><span class="image-overlay-product-container">
                                                            <ul class="form-overlay-item" pid="1000" hasicon="false" hasimages="true" iconvalue="">
                                                                <li class="image-overlay-image"><img loading="lazy" src="https://cdn.jotfor.ms/assets/img/payments/sample_image-3.png" /></li>
                                                                <li class="image-overlay-image"><img loading="lazy" src="https://cdn.jotfor.ms/assets/img/payments/sample_image-2.png" /></li>
                                                            </ul>
                                                        </span></div>
                                                        <%for(Food f: vector){%>
                                                        <input type="hidden" name="foodID" value="<%=f.getFoodID()%>">
                                                        <div data-wrapper-react="true"><span class="form-product-item hover-product-item " categories="non-categorized" pid="1000"><img src="https://cdn.jotfor.ms/assets/img/payments/sample_image-3.png" alt="product" class="form-product-image-with-options" width="50" loading="lazy" style="height:auto;vertical-align:middle" />
                                                                <div data-wrapper-react="true" class="form-product-item-detail"><input type="checkbox" class="form-checkbox  form-product-input" name="checkboxFoodID" value="<%=f.getFoodID()%>" /><label for="input_18_1000" class="form-product-container"><span data-wrapper-react="true"><span class="form-product-name" id="product-name-input_18_1000"><%=f.getFoodName()%></span><span class="form-product-details"><b><span data-wrapper-react="true">$<span><%=f.getPrice()%></span></span></b></span></span>
                                                                        <div class="form-product-description" id="product-name-description-input_18_1000">Description: <%=f.getDescription()%></div>
                                                                    </label><br /><br /><span class="form-sub-label-container" style="vertical-align:top"><label class="form-sub-label" for="input_18_quantity_1000_0" style="min-height:13px" aria-hidden="false">Quantity</label><select class="form-dropdown" name="quantity" id="input_18_quantity_1000_0">
                                                                            <option value="<%=cartController.getQuantityByFoodIDAndUserID(f.getFoodID(),user.getUserID())%>"><%=cartController.getQuantityByFoodIDAndUserID(f.getFoodID(),user.getUserID())%></option>
                                                                            <option value="1">1</option>
                                                                            <option value="2">2</option>
                                                                            <option value="3">3</option>
                                                                            <option value="4">4</option>
                                                                            <option value="5">5</option>
                                                                            <option value="6">6</option>
                                                                            <option value="7">7</option>
                                                                            <option value="8">8</option>
                                                                            <option value="9">9</option>
                                                                            <option value="10">10</option>
                                                                        </select>
                                                                    </span><br /><span class="form-special-subtotal"><span class="form-item-subtotal">Item subtotal:</span><span data-wrapper-react="true">$<span name="subTotal"><%=f.getPrice()*cartController.getQuantityByFoodIDAndUserID(f.getFoodID(),user.getUserID())%></span></span></span></div>
                                                                    <li class="form-line" data-type="control_button" id="id_8">
                                                                        <div id="cid_8" class="form-input-wide">
                                                                            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_8" type="submit" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="" name="update" value="<%=f.getFoodID()%>" >Delete Food</button></div>
                                                                        </div>
                                                                    </li>
                                                            
                                                        <%}%>
                </span><br /><span><b><span>Total</span> <span><span data-wrapper-react="true">$<span><%=(double) request.getAttribute("total")%></span></span></span></b></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%if (carts.size() > 0) {%>
                                        <li class="form-line" data-type="control_button" id="id_13">
                                            <div id="cid_13" class="form-input-wide">
                                                <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_13" type="submit" class="form-submit-button form-submit-button-simple_grey submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="" onclick="enableButton2()" name="update" value="update">Update Price</button></div>
                                            </div>
                                        </li>
                                        <li class="form-line" data-type="control_button" id="id_2">
                                            <div id="cid_2" class="form-input-wide">
                                                <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_2" type="submit" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="" name="update" value="buy"  disabled="">Buy</button></div>
                                            </div>
                                        </li>
                                    <%}%>
                                    
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
                            
                        </form>
                        
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

                        <script type="text/javascript">JotForm.ownerView=true;</script>
                        <script>
                            function enableButton2() {
            document.getElementById("input_2").disabled = false;
        }
                        </script>
    </body>
</html>
