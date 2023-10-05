<%-- 
    Document   : edit_food
    Created on : Jun 23, 2023, 10:36:21 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Food" %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Food</title>
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
        <link href="https://cdn01.jotfor.ms/static/formCss.css?3.3.43024" rel="stylesheet" type="text/css" />
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
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/nova.css?3.3.43024" />
        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/themes/CSS/566a91c2977cdfcd478b4567.css?v=3.3.43024&themeRevisionID=642aed92326239083fe53f08"/>
        <link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/css/styles/payment/payment_feature.css?3.3.43024" />
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/stylebuilder/donationBox.css?v=3.3.43024">
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

        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/buttons/form-submit-button-simple_blue.css?3.3.43024"/>
        <script src="https://cdn01.jotfor.ms/static/prototype.forms.js?3.3.43024" type="text/javascript"></script>
        <script src="https://cdn02.jotfor.ms/static/jotform.forms.js?3.3.43024" type="text/javascript"></script>
        <script src="https://cdn03.jotfor.ms/js/payments/validategateways.js?v=3.3.43024" type="text/javascript"></script>
        <script type="text/javascript">	JotForm.newDefaultTheme = false;
            JotForm.extendsNewTheme = false;
            JotForm.singleProduct = true;
            JotForm.newPaymentUIForNewCreatedForms = false;
            JotForm.submitError = "jumpToFirstError";

            JotForm.init(function () {
                /*INIT-START*/
                if (window.JotForm && JotForm.accessible)
                    $('input_56').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_57').setAttribute('tabindex', 0);
                if (window.JotForm && JotForm.accessible)
                    $('input_58').setAttribute('tabindex', 0);
                setTimeout(function () {
                    $('input_61').hint('e.g., 1$');
                }, 20);
                setTimeout(function () {
                    $('input_62').hint('1,2,...');
                }, 20);
                if (window.JotForm && JotForm.accessible)
                    $('input_60').setAttribute('tabindex', 0);
                JotForm.alterTexts({"couponApply": "Apply", "couponBlank": "Please enter a coupon.", "couponChange": "", "couponEnter": "Enter coupon", "couponExpired": "Coupon is expired. Please try another one.", "couponInvalid": "Coupon is invalid.", "couponValid": "Coupon is valid.", "shippingShipping": "Shipping", "taxTax": "Tax", "totalSubtotal": "Subtotal", "totalTotal": "Total"}, true);
                /*INIT-END*/
            });

            JotForm.prepareCalculationsOnTheFly([null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"name": "submit", "qid": "50", "text": "Update", "type": "control_button"}, null, null, null, null, null, {"description": "", "name": "typeA56", "qid": "56", "subLabel": "", "text": "Food Name", "type": "control_textbox"}, {"description": "", "name": "typeA57", "qid": "57", "subLabel": "", "text": "Category Name", "type": "control_textbox"}, {"description": "", "name": "typeA58", "qid": "58", "subLabel": "", "text": "Brand Name", "type": "control_textbox"}, null, {"description": "", "name": "typeA60", "qid": "60", "subLabel": "", "text": "Description", "type": "control_textarea"}, {"description": "", "name": "price", "qid": "61", "subLabel": "", "text": "Price", "type": "control_number"}, {"description": "", "name": "quantity", "qid": "62", "subLabel": "", "text": "Quantity", "type": "control_number"}]);
            setTimeout(function () {
                JotForm.paymentExtrasOnTheFly([null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"name": "submit", "qid": "50", "text": "Update", "type": "control_button"}, null, null, null, null, null, {"description": "", "name": "typeA56", "qid": "56", "subLabel": "", "text": "Food Name", "type": "control_textbox"}, {"description": "", "name": "typeA57", "qid": "57", "subLabel": "", "text": "Category Name", "type": "control_textbox"}, {"description": "", "name": "typeA58", "qid": "58", "subLabel": "", "text": "Brand Name", "type": "control_textbox"}, null, {"description": "", "name": "typeA60", "qid": "60", "subLabel": "", "text": "Description", "type": "control_textarea"}, {"description": "", "name": "price", "qid": "61", "subLabel": "", "text": "Price", "type": "control_number"}, {"description": "", "name": "quantity", "qid": "62", "subLabel": "", "text": "Quantity", "type": "control_number"}]);
            }, 20);
        </script>
    </head>
    <body>
        <%
            User user= (User) request.getAttribute("user");
            Food food= (Food) request.getAttribute("food");
            int quantity= (int) request.getAttribute("quantity");
            String message= (String) request.getAttribute("message");
        %>
        <li class="form-line" data-type="control_button" id="id_2">
            <div id="cid_2" class="form-input-wide">
                <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_2" type="button" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content=""><a style="text-decoration: none; color: white" href="/FoodController?action=myFood&cusID=<%=user.getUserID()%>">Back to My Food</a></button></div>
            </div>
        </li>
        <form class="jotform-form" action="/FoodController?action=editFood" method="Post" accept-charset="utf-8" autocomplete="on">
            <input type="hidden" name="cusID" value="<%=user.getUserID()%>">
            <input type="hidden" name="foodID" value="<%=food.getFoodID()%>">
            
            <div role="main" class="form-all">
                <ul class="form-section page-section">
                    <li id="cid_1" class="form-input-wide" data-type="control_head">
                        <div class="form-header-group  header-large">
                            <div class="header-text httac htvam">
                                <h1 id="header_1" class="form-header" data-component="header">Update Form</h1>
                            </div>
                        </div>
                    </li>
                    <article style="color: red"><%=message!= null? message: ""%></article>
                    <li class="form-line jf-required" data-type="control_textbox" id="id_56"><label class="form-label form-label-left form-label-auto" id="label_56" for="input_56"> Food Name<span class="form-required">*</span> </label>
                        <div id="cid_56" class="form-input jf-required"> <%=food.getFoodName()%> </div>
                    </li>
                    <li class="form-line" data-type="control_dropdown" id="id_3"><label class="form-label form-label-left form-label-auto" id="label_3" for="input_3"> Category </label>
                        <div id="cid_3" class="form-input"> <select class="form-dropdown" id="input_3" name="category" style="width:150px" data-component="dropdown" aria-label="Category">
                                <option value="<%=food.getCategoryName()%>" selected=""><%=food.getCategoryName()%></option>
                                <option value="" disabled="">Other category...</option>
                                <option value="Appetizer">Appetizer</option>
                                <option value="Main course">Main course</option>
                                <option value="Dessert">Dessert</option>
                                <option value="Fast food">Fast food</option>
                                <option value="Soup">Soup</option>
                            </select> </div>
                    </li>
                    <li class="form-line jf-required" data-type="control_textbox" id="id_58"><label class="form-label form-label-left form-label-auto" id="label_58" for="input_58"> Brand Name<span class="form-required">*</span> </label>
                        <div id="cid_58" class="form-input jf-required"> <input type="text" id="input_58" name="brand" value="<%=food.getBrandName()%>" data-type="input-textbox" class="form-textbox validate[required]" data-defaultvalue="" size="20" value="" data-component="textbox" aria-labelledby="label_58" required="" /> </div>
                    </li>
                    <li class="form-line" data-type="control_number" id="id_61"><label class="form-label form-label-left form-label-auto" id="label_61" for="input_61"> Price </label>
                        <div id="cid_61" class="form-input"> <input type="number" id="input_61" name="price" value="<%=food.getPrice()%>" data-type="input-number" class=" form-number-input form-textbox" data-defaultvalue="" style="width:60px" size="5" value="" placeholder="e.g., 1$" data-component="number" aria-labelledby="label_61" step="any" /> </div>
                    </li>
                    <li class="form-line" data-type="control_number" id="id_62"><label class="form-label form-label-left form-label-auto" id="label_62" for="input_62"> Quantity </label>
                        <div id="cid_62" class="form-input"> <input type="number" id="input_62" name="quantity" value="<%=quantity%>" data-type="input-number" class=" form-number-input form-textbox" data-defaultvalue="" style="width:60px" size="5" value="" placeholder="1,2,..." data-numbermin="0" data-numbermax="1000" data-component="number" aria-labelledby="label_62" step="any" /> </div>
                    </li>
                    <li class="form-line" data-type="control_textarea" id="id_60"><label class="form-label form-label-left form-label-auto" id="label_60" for="input_60"> Description (Optional) </label>
                        <div id="cid_60" class="form-input"> <textarea id="input_60" class="form-textarea" name="description" value="<%=food.getDescription()%>" cols="40" rows="6" data-component="textarea" aria-labelledby="label_60"><%=food.getDescription()%></textarea> </div>
                    </li>
                    <li class="form-line" data-type="control_button" id="id_50">
                        <div id="cid_50" class="form-input-wide">
                            <div data-align="center" class="form-buttons-wrapper form-buttons-center   jsTest-button-wrapperField"><button id="input_50" type="submit" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="">Update</button><span> </span><button id="input_reset_50" type="reset" class="form-submit-reset form-submit-button-simple_blue jf-form-buttons" data-component="button">Reset</button></div>
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
        </form>
    </body>
</html>
