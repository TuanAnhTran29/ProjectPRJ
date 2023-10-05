<%-- 
    Document   : edit_profile
    Created on : Jun 21, 2023, 4:10:39 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="https://cdn01.jotfor.ms/static/formCss.css?3.3.42956" rel="stylesheet" type="text/css" />
        <style type="text/css">
            @media print{
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
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/nova.css?3.3.42956" />
        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/themes/CSS/566a91c2977cdfcd478b4567.css?v=3.3.42956&themeRevisionID=642aed92326239083fe53f08"/>
        <link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/css/styles/payment/payment_feature.css?3.3.42956" />
        <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/stylebuilder/donationBox.css?v=3.3.42956">
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

        <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/buttons/form-submit-button-simple_blue.css?3.3.42956"/>
        <script src="https://cdn01.jotfor.ms/static/prototype.forms.js?3.3.42956" type="text/javascript"></script>
        <script src="https://cdn02.jotfor.ms/static/jotform.forms.js?3.3.42956" type="text/javascript"></script>
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/punycode/1.4.1/punycode.js"></script>
        <script src="https://cdn03.jotfor.ms/js/payments/validategateways.js?v=3.3.42956" type="text/javascript"></script>
        <script type="text/javascript">	JotForm.newDefaultTheme = false;
            JotForm.extendsNewTheme = false;
            JotForm.singleProduct = true;
            JotForm.newPaymentUIForNewCreatedForms = false;
            JotForm.submitError = "jumpToFirstError";

            JotForm.init(function () {
                /*INIT-START*/
                JotForm.alterTexts({"couponApply": "Apply", "couponBlank": "Please enter a coupon.", "couponChange": "", "couponEnter": "Enter coupon", "couponExpired": "Coupon is expired. Please try another one.", "couponInvalid": "Coupon is invalid.", "couponValid": "Coupon is valid.", "shippingShipping": "Shipping", "taxTax": "Tax", "totalSubtotal": "Subtotal", "totalTotal": "Total"}, true);
                /*INIT-END*/
            });

            JotForm.prepareCalculationsOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Edit Profile", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Buy", "type": "control_button"}, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"description": "", "name": "name", "qid": "23", "text": "Name", "type": "control_fullname"}, {"description": "", "name": "username", "qid": "24", "subLabel": "", "text": "Username", "type": "control_email"}, null, null, null, null, null, {"description": "", "name": "address", "qid": "30", "subLabel": "", "text": "Address", "type": "control_email"}]);
            setTimeout(function () {
                JotForm.paymentExtrasOnTheFly([null, {"name": "clickTo", "qid": "1", "text": "Edit Profile", "type": "control_head"}, {"name": "submit", "qid": "2", "text": "Buy", "type": "control_button"}, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {"description": "", "name": "name", "qid": "23", "text": "Name", "type": "control_fullname"}, {"description": "", "name": "username", "qid": "24", "subLabel": "", "text": "Username", "type": "control_email"}, null, null, null, null, null, {"description": "", "name": "address", "qid": "30", "subLabel": "", "text": "Address", "type": "control_email"}]);
            }, 20);
        </script>
    </head>
    
    <body>
        <%
            User user= (User) request.getAttribute("user");
            String message= (String) request.getAttribute("message");
        %>
        <li class="form-line" data-type="control_button" id="id_2">
            <div id="cid_2" class="form-input-wide">
                <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_2" type="button" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content=""><a style="text-decoration: none; color: white" href="/UserController?action=viewProfile&cusID=<%=user.getUserID()%>">Back to My Profile</a></button></div>
            </div>
        </li>
        <form class="jotform-form" action="/UserController?action=editProfile" method="Post" accept-charset="utf-8" autocomplete="on">
            <input type="hidden" name="cusID" value="<%=user.getUserID()%>">
            <div role="main" class="form-all">
                <ul class="form-section page-section">
                    <li id="cid_1" class="form-input-wide" data-type="control_head">
                        <div class="form-header-group  header-large">
                            <div class="header-text httac htvam">
                                <h1 id="header_1" class="form-header" data-component="header">Edit Profile</h1>
                            </div>
                        </div>
                    </li>
                    <article style="color: red"><%=message!= null? message: ""%></article>
                    <li class="form-line" data-type="control_fullname" id="id_23"><label class="form-label form-label-left form-label-auto" id="label_23" for="first_23"> Name </label>
                        <div id="cid_23" class="form-input">
                            <div data-wrapper-react="true"><span class="form-sub-label-container" style="vertical-align:top" data-input-type="first"><input type="text" id="first_23" name="firstName" class="form-textbox" data-defaultvalue="" autoComplete="section-input_23 given-name" size="10" value="<%=user.getFirstName()%>" data-component="first" aria-labelledby="label_23 sublabel_23_first" /><label class="form-sub-label" for="first_23" id="sublabel_23_first" style="min-height:13px" aria-hidden="false">First Name</label></span><span class="form-sub-label-container" style="vertical-align:top" data-input-type="last"><input type="text" id="last_23" name="lastName" class="form-textbox" data-defaultvalue="" autoComplete="section-input_23 family-name" size="15" value="<%=user.getLastName()%>" data-component="last" aria-labelledby="label_23 sublabel_23_last" /><label class="form-sub-label" for="last_23" id="sublabel_23_last" style="min-height:13px" aria-hidden="false">Last Name</label></span></div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_textbox" id="id_35"><label class="form-label form-label-left form-label-auto" id="label_35" for="input_35"> Username </label>
                        <div id="cid_35" class="form-input"> <input type="text" id="input_35" name="username" data-type="input-textbox" class="form-textbox" data-defaultvalue="" size="20" value="<%=user.getUsername()%>" data-component="textbox" aria-labelledby="label_35" /> </div>
                    </li>
                    <li class="form-line" data-type="control_textbox" id="id_36"><label class="form-label form-label-left form-label-auto" id="label_36" for="input_36"> Address </label>
                        <div id="cid_36" class="form-input"> <input type="text" id="input_36" name="address" data-type="input-textbox" class="form-textbox" data-defaultvalue="" size="20" value="<%=user.getAddress()%>" data-component="textbox" aria-labelledby="label_36" /> </div>
                    </li>
                    <li class="form-line" data-type="control_button" id="id_2">
                        <div id="cid_2" class="form-input-wide">
                            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField"><button id="input_2" type="submit" class="form-submit-button form-submit-button-simple_blue submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="">Edit</button><span> </span><button id="input_reset_2" type="reset" class="form-submit-reset form-submit-button-simple_blue jf-form-buttons" data-component="button">Reset</button></div>
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
        
        <script type="text/javascript">JotForm.ownerView=true;</script>
    </body>
</html>
