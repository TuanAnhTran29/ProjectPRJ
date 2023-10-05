<%-- 
    Document   : order_detail
    Created on : Jun 19, 2023, 12:00:21 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="model.Food" %>
<%@page import="model.User" %>
<%@page import="controller.FoodController" %>
<%@page import="model.Order_Food" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
    </head>
    
    <link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F231692820268460" title="oEmbed Form">
    <link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F231692820268460" title="oEmbed Form">
    <meta property="og:title" content="Responsive Product Order Form" >
    <meta property="og:url" content="https://form.jotform.com/231692820268460" >
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
    </script><link rel="canonical" href="https://form.jotform.com/231692820268460" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=1" />
    <meta name="HandheldFriendly" content="true" />
    <title>Responsive Product Order Form</title>
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
    <link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?v=3.3.42867&themeRevisionID=5f7ed99c2c2c7240ba580251"/>
    <link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/payment/payment_styles.css?3.3.42867" />
    <link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/payment/payment_feature.css?3.3.42867" />
    <link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/stylebuilder/donationBox.css?v=3.3.42867">
    <style type="text/css" id="form-designer-style">
        /* Injected CSS Code */

      /*PREFERENCES STYLE*/
      /* NEW THEME STYLE */
      .form-header-group .form-header,
      .appointmentCalendarContainer .monthYearPicker .pickerItem select,
      .appointmentCalendarContainer .currentDate,
      .appointmentCalendar .calendarDay {
        color: undefined;
      }
      li[data-type=control_fileupload] .qq-upload-button {
        color: undefined;
      }
      .signature-wrapper, .signature-wrapper .pad, .jSignature, .signature-pad-passive, .signature-pad-wrapper {
        color: undefined;
      }
      .form-dropdown,
      .form-textarea,
      .form-textbox,
      .form-checkbox-item .form-checkbox + label:before, .form-radio-item .form-radio + label:before,
      .form-radio-item .form-radio + span:before, .form-checkbox-item .form-checkbox + span:before,
      .rating-item label,
      .signature-pad-passive,
      .signature-wrapper,
      .form-radio-other-input, .form-checkbox-other-input, .form-captcha input, .form-spinner input,
      .appointmentCalendarContainer {
        border-color: undefined;
        background-color: undefined;
      }
      .form-matrix-column-headers, .form-matrix-table td,
      .form-matrix-table td:last-child, .form-matrix-table th,
      .form-matrix-table th:last-child, .form-matrix-table tr:last-child td,
      .form-matrix-table tr:last-child th,
      .form-matrix-table tr:not([role=group])+tr[role=group] th,
      .form-matrix-column-headers, .form-matrix-table td,
      .form-matrix-table td:last-child, .form-matrix-table th,
      .form-matrix-table th:last-child, .form-matrix-table tr:last-child td,
      .form-matrix-table tr:last-child th,
      .form-matrix-table tr:not([role=group])+tr[role=group] th,
      .form-matrix-headers.form-matrix-column-headers,
      .appointmentCalendarContainer .monthYearPicker .pickerItem+.pickerItem,
      .appointmentCalendarContainer .monthYearPicker,
      .isSelected .form-matrix-column-headers:nth-last-of-type(2),
      li[data-type=control_fileupload] .qq-upload-button {
        border-color: undefined;
      }
      li[data-type="control_datetime"] .extended .allowTime-container + .form-sub-label-container {
        background-color: undefined;
        color: undefined;
      }
      .form-subHeader, .form-sub-label {
        color: undefined;
      }
      li[data-type=control_fileupload] .qq-upload-button {
        background-color: undefined;
      }
      .form-matrix-values {
        background-color: undefined;
      }
      .rating-item label {
        color: undefined;
      }
      .rating-item input:focus+label, .rating-item input:hover+label {
        color: #ffffff;
        background-color: undefined;
        border-color:  undefined;
      }
      .form-checkbox + label:before, .form-radio + label:before,
      .form-radio + span:before, .form-checkbox + span:before {
        background-color: undefined;
        border-color: undefined;
        color: undefined;
      }
      .form-radio-item .form-radio:checked+label:before, form-radio-item .form-radio:checked+span:before,
      .form-radio:checked+label:before,
      .form-checkbox:checked+label:before {
        border-color: undefined;
      }
      .form-radio-item .form-radio:checked+label:after, form-radio-item .form-radio:checked+span:after {
        background-color: undefined;
        border-color:  undefined;
        color: #ffffff;
      }
      input.form-radio:checked + label:after,
      input.form-checkbox:checked+label:after,
      .form-line[data-payment="true"] .form-product-item .p_checkbox .checked {
        background-color: undefined;
        border-color:  undefined;
        color: #ffffff;
      }
      .rating-item input:checked+label {
        background-color: undefined;
        border-color:  undefined;
        color: #ffffff;
      }
      .appointmentDayPickerButton:hover {
        background-color: undefined;
      }
      .appointmentCalendarContainer,
      .appointmentSlot,
      .rating-item-title.for-to > label:first-child,
      .rating-item-title.for-from > label:first-child,
      .rating-item-title .editor-container * {
        background: none;
      }
      .rating-item-title.for-to > label:first-child,
      .rating-item-title.for-from > label:first-child,
      .rating-item-title .editor-container * {
        color: undefined
      }
      .JotFormBuilder .appContainer #app li.form-line[data-type=control_matrix].isSelected .questionLine-editButton.forRemove:after,
      .JotFormBuilder .appContainer #app li.form-line[data-type=control_matrix].isSelected .questionLine-editButton.forRemove:before {
        background-color: undefined;
      }
      .appointmentSlot,
      .appointmentCalendar .calendarDay.isToday .calendarDayEach {
        color: undefined;
        border-color: undefined;
      }
      .appointmentSlot:not(.disabled):not(.active):hover {
        background-color: undefined;
      }
      .form-textbox::placeholder,
      .form-dropdown:not(.time-dropdown):not(:required),
      .form-dropdown:not(:required),
      .form-dropdown:required:invalid {
        color: undefined;
      }
      li[data-type=control_fileupload] .jfUpload-heading {
        color:undefined;
      }
      .appointmentCalendar .calendarDay:not(.empty):hover .calendarDayEach {
        border-color: undefined;
      }
      .appointmentCalendar .calendarDay.isActive .calendarDayEach,
      .appointmentCalendar .calendarDay:after,
      .appointmentFieldRow.forSelectedDate {
        background-color: undefined;
        border-color: undefined;
        color: #FFFFFF;
      }
      @keyframes indicate {
        0% {
          color: undefined;
          background-color: transparent;
        }
        100% {
          color: #fff;
          background-color: undefined;
        }
      }
      .appointmentSlot.active {
        animation: indicate 0.2s linear forwards;
      }
      .appointmentField .timezonePickerName:before {

      }
      .appointmentCalendarContainer .monthYearPicker .pickerArrow.prev:after {

      }
      .appointmentCalendarContainer .monthYearPicker .pickerArrow.next:after {

      }
      .appointmentField .timezonePickerName:after {

        width: 11px;
      }
      .appointmentCalendar .calendarDay.isUnavailable ::placeholder,
      .appointmentCalendar .calendarDay.isUnavailable {
        color: undefined;
      }
      .appointmentDayPickerButton {
        background-color: undefined;
      }
      .form-collapse-table, .form-collapse-table:hover {
        background-color: undefined;
        color: undefined;
      }
      .form-sacl-button.jf-form-buttons,
      .form-submit-print.jf-form-buttons {
        color: undefined;
        border-color: undefined;
        background-color: undefined;
      }
      .form-pagebreak-next:hover  {
        background-color: undefined;
        border-color: undefined;
      }
      .form-pagebreak-back:hover  {
        background-color: undefined;
        border-color: undefined;
      }
      .form-pagebreak-next {
        background-color: undefined;
        border-color: undefined;
        color: undefined;
      }
      .form-pagebreak-back {
        background-color: undefined;
        border-color: undefined;
        color: undefined;
      }
      li[data-type=control_datetime] [data-wrapper-react=true].extended>div+.form-sub-label-container .form-textbox:placeholder-shown,
      li[data-type=control_datetime] [data-wrapper-react=true]:not(.extended) .form-textbox:not(.time-dropdown):placeholder-shown,
      .appointmentCalendarContainer .currentDate {

      }
      .form-star-rating-star.Stars {

      }
      .signature-pad-passive, .signature-placeholder:after {

      }
      .form-pagebreak,
      .form-pagebreak > div, .form-buttons-wrapper,
      .form-pagebreak,
      .form-submit-clear-wrapper, .form-header-group {
        border-color: undefined;
      }
      .submit-button {
        background-color: undefined;
        border-color: undefined;
      }
      .submit-button:hover {
        background-color: undefined;
        border-color: undefined;
      }
      .form-matrix-headers.form-matrix-column-headers,
      .form-matrix-row-headers {
        background-color: undefined;
        color: undefined;
      }
      .appointmentCalendar .dayOfWeek {
        color: undefined;
        background-color: undefined;
      }
      .form-spinner-button-container > * {
        background-color: undefined;
        color: undefined;
      }
      .clear-pad-btn {
        background-color: undefined;
        color: undefined;
      }
      .form-line-active {
        background-color: undefined;
      }
      .form-line-error {
        background-color: undefined;
      }
      .form-spinner-button.form-spinner-up:before {

      }
      .form-spinner-button.form-spinner-down:before {

      }
      .form-collapse-table:after{

      }
      li[data-type=control_fileupload] .qq-upload-button:before {

      }
      .appointmentDayPickerButton {

      }
      div.stageEmpty.isSmall {
        border-color: undefined;
        color: undefined;
      }
      select.form-dropdown.is-active,
      select.form-dropdown.is-active:not(.time-dropdown):not(:required) {
        color: undefined;
      }
      .form-line[data-payment=true] .form-dropdown,
      .form-line[data-payment=true] .form-dropdown.is-active,
      .form-line[data-payment=true] .select-area .selected-values {
        color: undefined;
      }
      .form-line[data-payment=true] .form-special-subtotal {
        color: undefined;
      }
      .form-line[data-payment=true].card-2col .form-product-details,
      .form-line[data-payment=true].card-3col .form-product-details {
        color: undefined;
      }
      .form-line[data-payment=true] button#coupon-button {
        border-color: undefined;
        background-color: undefined;
      }
      .form-product-category-item .selected-items-icon {
        background-color: undefined;
        border-color: undefined;
      }
      .filter-container #productSearch-input::placeholder,
      .form-line[data-payment=true] #coupon-input::placeholder,
      .selected-values::placeholder,
      .dropdown-hint {
        color: undefined;
      }
      .form-line[data-payment=true] .form-textbox,
      .form-line[data-payment=true] .select-area,
      .form-line[data-payment=true] #coupon-input,
      .form-line[data-payment=true] #coupon-container input,
      .form-line[data-payment=true] input#productSearch-input,
      .form-line[data-payment=true] .form-product-category-item:after,
      .form-line[data-payment=true] .filter-container .dropdown-container .select-content,
      .form-line[data-payment=true] .form-textbox.form-product-custom_quantity,
      .form-line[data-payment="true"] .form-product-item .p_checkbox .select_border,
      .form-line[data-payment="true"] .form-product-item .form-product-container .form-sub-label-container span.select_cont,
      .form-line[data-payment=true] select.form-dropdown {
        border-color: undefined;
        border-color: undefined;
      }
      .form-line[data-payment="true"] hr,
      .form-line[data-payment=true] .p_item_separator,
      .form-line[data-payment="true"] .payment_footer.new_ui,
      .form-line.card-3col .form-product-item.new_ui,
      .form-line.card-2col .form-product-item.new_ui {
        border-color: undefined;
        border-color: undefined;
      }
      .form-line[data-payment=true] .form-product-category-item {
        border-color: undefined;
        border-color: undefined;
      }
      .form-line[data-payment=true] #coupon-input,
      .form-line[data-payment=true] .form-textbox.form-product-custom_quantity,
      .form-line[data-payment=true] input#productSearch-input,
      .form-line[data-payment=true] .select-area,
      .form-line[data-payment=true] .custom_quantity,
      .form-line[data-payment=true] .filter-container .select-content,
      .form-line[data-payment=true] .p_checkbox .select_border {
        background-color: undefined;
      }
      .form-product-category-item:after {
       background-color: undefined;
       border-color: undefined;
      }
      .form-line[data-payment=true].form-line.card-3col .form-product-item,
      .form-line[data-payment=true].form-line.card-2col .form-product-item {
       background-color: undefined;
      }
      .form-line[data-payment="true"] .form-product-category-item:after {

      }
      .form-line[data-payment=true] .payment-form-table input.form-textbox,
      .form-line[data-payment=true] .payment-form-table input.form-dropdown,
      .form-line[data-payment=true] .payment-form-table .form-sub-label-container > div,
      .form-line[data-payment=true] .payment-form-table span.form-sub-label-container iframe,
      .form-line[data-type=control_square] .payment-form-table span.form-sub-label-container iframe {
        border-color: undefined;
      }

      .form-dropdown:hover, .form-textarea:hover, .form-textbox:hover, .signature-wrapper:hover {
        border-color: undefined;
        box-shadow: 0 0 0 2px undefined;
      }

      .form-dropdown:focus, .form-textarea:focus, .form-textbox:focus, .signature-wrapper:focus {
        border-color: undefined;
        box-shadow: 0 0 0 3px undefined;
      }
      .form-checkbox:hover+label:before, .form-checkbox:hover+span:before, .form-radio:hover+label:before, .form-radio:hover+span:before {
        box-shadow: 0 0 0 2px undefined;
      }
      .form-checkbox:focus+label:before, .form-checkbox:focus+span:before, .form-radio:focus+label:before, .form-radio:hover+cocus:before {
        box-shadow: 0 0 0 3px undefined;
      }
        /* NEW THEME STYLE */
      /*PREFERENCES STYLE*/

    *,
    *:after,
    *:before {
      box-sizing: border-box;
    }
    .form-all {
      font-family: "Inter", sans-serif;
    }
    .main .jotform-form {
      width: 100%;
      padding: 0 3%;
    }
    .form-all {
      display: flex;
      flex-direction: column;
      width: 100%;
      max-width: 752px;
    }
    .form-line-active {
      background-color: #ffffe0;
    }
    .form-all {
      font-size: 16px;
    }
    li.form-line {
      margin-top: 12px;
      margin-bottom: 12px;
    }
    .form-line {
      padding: 12px 10px;
    }
    .form-section {
      padding: 0px 38px;
    }
    .form-textbox,
    .form-textarea {
      padding: 1px 10px 1px 10px;
    }
    .form-textbox,
    .form-textarea,
    .form-radio-other-input,
    .form-checkbox-other-input,
    .form-captcha input,
    .form-spinner input {
      background-color: #ffffff;
    }
    .form-label {
      font-family: "Inter", sans-serif;
    }
    .form-line-column {
      width: calc(50% - 8px);
    }
    .form-line-column.form-line-column-clear {
      width: calc(43%);
    }
    .form-iframe-container .disallowed--formFooter {
      font-size: 16px;
    }
    .form-iframe-container .disallowed--formFooter-leftSide {
      margin-left: 52px;
      margin-right: 0;
    }
    .form-iframe-container .disallowed--formFooter-rightSide {
      position: absolute;
      right: 34%;
    }
    .form-checkbox-item label,
    .form-checkbox-item span,
    .form-radio-item label,
    .form-radio-item span {
      color: #6f6f6f;
    }
    .form-radio-item,
    .form-checkbox-item {
      padding-bottom: 0px !important;
    }
    .form-radio-item:last-child,
    .form-checkbox-item:last-child {
      padding-bottom: 0;
    }
    .form-single-column .form-checkbox-item,
    .form-single-column .form-radio-item {
      width: 100%;
    }
    .form-checkbox-item .editor-container div,
    .form-radio-item .editor-container div {
      position: relative;
    }
    .form-checkbox-item .editor-container div:before,
    .form-radio-item .editor-container div:before {
      display: inline-block;
      vertical-align: middle;
      left: 0;
      width: 20px;
      height: 20px;
    }
    .form-all .form-pagebreak-back,
    .form-all .form-pagebreak-next {
      font-size: 1em;
      padding: 9px 15px;
      font-family: "Inter", sans-serif;
      font-size: 16px;
      font-weight: normal;
    }
    .form-all .qq-upload-button,
    .form-all .form-submit-button,
    .form-all .form-submit-reset,
    .form-all .form-submit-print {
      font-size: 1em;
      padding: 9px 15px;
      font-family: "Inter", sans-serif;
      font-size: 16px;
      font-weight: normal;
    }
    li[data-type="control_image"] div {
      text-align: left;
    }
    li[data-type="control_image"] img {
      border: none;
      border-width: 0px !important;
      border-style: solid !important;
      border-color: false !important;
    }
    .supernova {
      height: 100%;
      background-repeat: no-repeat;
      background-attachment: scroll;
      background-position: center top;
      background-attachment: fixed;
      background-size: auto;
      background-size: cover;
    }
    .supernova {
      background-image: none;
    }
    #stage {
      background-image: none;
    }
    /* | */
    .form-all {
      background-repeat: no-repeat;
      background-attachment: scroll;
      background-position: center top;
      background-attachment: fixed;
      background-size: auto;
      background-size: cover;
    }
    .form-header-group {
      background-repeat: no-repeat;
      background-attachment: scroll;
      background-position: center top;
    }
    .header-large h1.form-header {
      font-size: 2em;
    }
    .header-large h2.form-header {
      font-size: 1.5em;
    }
    .header-large h3.form-header {
      font-size: 1.17em;
    }
    .header-large h1 + .form-subHeader {
      font-size: 1em;
    }
    .header-large h2 + .form-subHeader {
      font-size: .875em;
    }
    .header-large h3 + .form-subHeader {
      font-size: .75em;
    }
    .header-default h1.form-header {
      font-size: 2em;
    }
    .header-default h2.form-header {
      font-size: 1.5em;
    }
    .header-default h3.form-header {
      font-size: 1.17em;
    }
    .header-default h1 + .form-subHeader {
      font-size: 1em;
    }
    .header-default h2 + .form-subHeader {
      font-size: .875em;
    }
    .header-default h3 + .form-subHeader {
      font-size: .75em;
    }
    .header-small h1.form-header {
      font-size: 2em;
    }
    .header-small h2.form-header {
      font-size: 1.5em;
    }
    .header-small h3.form-header {
      font-size: 1.17em;
    }
    .header-small h1 + .form-subHeader {
      font-size: 1em;
    }
    .header-small h2 + .form-subHeader {
      font-size: .875em;
    }
    .header-small h3 + .form-subHeader {
      font-size: .75em;
    }
    .form-header-group {
      text-align: left;
    }
    .form-header-group {
      font-family: "Inter", sans-serif;
    }
    div.form-header-group.header-large {
      margin: 0px -38px;
    }
    div.form-header-group.header-large {
      padding: 0px 0px;
    }
    .form-header-group {
      background-color: rgba(255, 255, 255, 0);
    }
    .form-line-error {
      overflow: hidden;
      -webkit-transition-property: none;
      -moz-transition-property: none;
      -ms-transition-property: none;
      -o-transition-property: none;
      transition-property: none;
      -webkit-transition-duration: 0.3s;
      -moz-transition-duration: 0.3s;
      -ms-transition-duration: 0.3s;
      -o-transition-duration: 0.3s;
      transition-duration: 0.3s;
      -webkit-transition-timing-function: ease;
      -moz-transition-timing-function: ease;
      -ms-transition-timing-function: ease;
      -o-transition-timing-function: ease;
      transition-timing-function: ease;
      background-color: #fff4f4;
    }
    .form-line-error .form-error-message {
      background-color: #f23a3c;
      clear: both;
      float: none;
    }
    .form-line-error .form-error-message .form-error-arrow {
      border-bottom-color: #f23a3c;
    }
    .form-line-error input:not(#coupon-input),
    .form-line-error textarea,
    .form-line-error .form-validation-error {
      border: 1px solid #f23a3c;
      box-shadow: 0 0 3px #f23a3c;
    }
    .supernova {
      background-color: #ffffff;
      background-color: #ecedf3;
    }
    .supernova body {
      background-color: transparent;
    }
    .supernova .form-all,
    .form-all {
      background-color: #ffffff;
    }
    .form-textbox,
    .form-textarea,
    .form-radio-other-input,
    .form-checkbox-other-input,
    .form-captcha input,
    .form-spinner input {
      background-color: #ffffff;
    }
    .form-matrix-table tr {
      border-color: #e6e6e6;
    }
    .form-matrix-table tr:nth-child(2n) {
      background-color: #f2f2f2;
    }
    .form-all {
      color: #2c3345;
    }
    .form-label-top,
    .form-label-left,
    .form-label-right,
    .form-html {
      color: #555555;
    }
    .form-line-error {
      overflow: hidden;
      -webkit-transition-property: none;
      -moz-transition-property: none;
      -ms-transition-property: none;
      -o-transition-property: none;
      transition-property: none;
      -webkit-transition-duration: 0.3s;
      -moz-transition-duration: 0.3s;
      -ms-transition-duration: 0.3s;
      -o-transition-duration: 0.3s;
      transition-duration: 0.3s;
      -webkit-transition-timing-function: ease;
      -moz-transition-timing-function: ease;
      -ms-transition-timing-function: ease;
      -o-transition-timing-function: ease;
      transition-timing-function: ease;
      background-color: #fff4f4;
    }

    /*__INSPECT_SEPERATOR__*/
    .form-all {
        border : 5px solid;
        border-image-slice : 1;
        border-width : 10px;
        border-image-source : linear-gradient(to left, #f3574b, #333333);
    }

    .form-header-group.header-default {
        border-bottom : 2px solid;
    }


        /* Injected CSS Code */
    </style>

    <script src="https://cdn02.jotfor.ms/static/prototype.forms.js?3.3.42867" type="text/javascript"></script>
    <script src="https://cdn03.jotfor.ms/static/jotform.forms.js?3.3.42867" type="text/javascript"></script>
    <script src="https://cdn01.jotfor.ms/js/payments/PaymentListSettings/searchInProducts.js?v=3.3.42867" type="text/javascript"></script>
    <script src="https://cdn02.jotfor.ms/js/payments/validategateways.js?v=3.3.42867" type="text/javascript"></script>
    <script src="https://cdn03.jotfor.ms/js/vendor/math-processor.js?v=3.3.42867" type="text/javascript"></script>
    
    
    <body>
        <%
                    User user= (User) request.getAttribute("user");
                    Vector<Order_Food> order_food= (Vector<Order_Food>) request.getAttribute("order");
                    FoodController foodController= (FoodController) request.getAttribute("foodController");
                    String message= (String) request.getAttribute("message");
                    double totalPrice= (double) request.getAttribute("totalPrice");
                    int orderID= (int) request.getAttribute("orderID");
                    User customer= (User) request.getAttribute("customer");
        %>
        <form class="jotform-form" action="/OrderController?action=submitOrder" method="Post" accept-charset="utf-8" autocomplete="on">
            <!--<input type="hidden" name="action" value="viewAcceptedOrder">-->
            <input type="hidden" name="cusID" value="<%=user.getUserID()%>">
            <input type="hidden" name="orderID" value="<%=orderID%>">
            <div role="main" class="form-all">
                <ul class="form-section page-section">
                    <li id="cid_22" class="form-input-wide" data-type="control_head">
                        <div style="display:table;width:100%">
                            <div class="form-header-group hasImage header-default" data-imagealign="Left">
                                <div class="header-logo"><img src="https://www.jotform.com/uploads/utkuyildirim/form_files/Screen%20Shot%202020-12-08%20at%2011.53.28.5fcf5bf9415a57.30431619.png" alt="Order Details" width="50" class="header-logo-left" /></div>
                                <div class="header-text httal htvam">
                                    <h2 id="header_22" class="form-header" data-component="header">Order Accepted Details</h2>
                                </div>
                                <article style="color: red"><%=message!= null? message: ""%></article>
                            </div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_payment" id="id_24" data-payment="true"><label class="form-label form-label-top search-enabled p-filter-one-column" id="label_24" for="input_24"> My Foods </label>
                        
                        <div id="cid_24" class="form-input-wide" data-layout="full">
                            <div data-wrapper-react="true">
                                <div data-wrapper-react="true" class="product-container-wrapper">
                                    <div>
                                        Customer Name: <%=customer.getFirstName() + " " + customer.getLastName()%>
                                    </div>
                                    <br>
                                    <div>
                                        Username: <%=customer.getUsername()%>
                                    </div>
                                    <br>
                                    <div>
                                        Phone number: <%=customer.getPhone()%>
                                    </div>
                                    <br>
                                    <div>
                                        Email: <%=customer.getEmail()%>
                                    </div>
                                    <br>
                                    <div>
                                        Address: <%=customer.getAddress()%>
                                    </div>
                                    <br>
                                    <div data-wrapper-react="true"><span class="form-product-item hover-product-item  show_image show_desc show_option new_ui" categories="non-categorized" pid="1001" aria-labelledby="label_24">
                                            <%for(Order_Food of: order_food){%>
                                            <div data-wrapper-react="true">
                                                    <div data-wrapper-react="true"><span class="form-product-item hover-product-item  show_image show_desc show_option new_ui" categories="non-categorized" pid="1001" aria-labelledby="label_24">
                                                            <div data-wrapper-react="true" class="form-product-item-detail new_ui">
                                                                
                                                                <div class="p_image">
                                                                    <div class="image_area form-product-image-with-options">
                                                                        <div style="position:absolute;width:100%;height:100%"><img role="img" aria-label="White T-Shirt" alt="White T-Shirt Product Image" style="width:100%;height:100%;object-fit:cover" src="https://www.jotform.com/uploads/utkuyildirim/form_files/Screen%20Shot%202020-12-08%20at%2010.47.46.png" loading="lazy" /></div>
                                                                    </div>
                                                                </div>
                                                                <div for="input_24_1001" class="form-product-container"><span data-wrapper-react="true">
                                                                        <div class="title_description"><span class="form-product-name" id="product-name-input_24_1001"><%=foodController.findByID(of.getFoodID()).getFoodName()%></span><span class="form-product-description" id="product-name-description-input_24_1001"><%=foodController.findByID(of.getFoodID()).getDescription()%></span></div><span class="form-product-details"><b><span data-wrapper-react="true">$<span id="input_24_1001_price"><%=of.getList_price()%></span></span></b></span>
                                                                    </span><span class="form-sub-label-container" style="vertical-align:top"><label class="form-sub-label" for="input_24_quantity_1001_0" style="min-height:13px" aria-hidden="false">Quantity</label><%=of.getQuantity()%>
                                                                </div>
                                                                <div class="focus_action_button_container"><a class="btn-inline-product-delete"> </a><a class="btn-inline-product-settings"> </a></div>
                                                            </div>
                                            <%}%>
                                        
                                        <div class="payment_footer new_ui ">
                                            <div class="total_area">
                                                <div class="form-payment-total">
                                                    <div id="total-text">Total</div>
                                                    <div class="form-payment-price"><span data-wrapper-react="true">$<span id="payment_total"><%=totalPrice%></span></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_button" id="id_13">
                        <div id="cid_13" class="form-input-wide" data-layout="full">
                            <div data-align="center" class="form-buttons-wrapper form-buttons-center   jsTest-button-wrapperField"><button id="input_13" type="submit" class="form-submit-button submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="">Submit Order</button></div> <div data-align="center" class="form-buttons-wrapper form-buttons-center   jsTest-button-wrapperField"><button id="input_13" type="button" class="form-submit-button submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content=""><a style="color: white;text-decoration: none" href="/OrderController?action=viewAcceptedOrder&cusID=<%=user.getUserID()%>&orderID=<%=orderID%>">Back to Accepted Orders</a></button></div>
                        </div>
                    </li>
                </ul>
            </div>
            <script>
              JotForm.showJotFormPowered = "new_footer";
            </script>
            
        </form>
        
        <script type="text/javascript">JotForm.ownerView=true;</script><script src="https://cdn.jotfor.ms//js/vendor/smoothscroll.min.js?v=3.3.42867"></script>
        <script src="https://cdn.jotfor.ms//js/errorNavigation.js?v=3.3.42867"></script>
    </body>
</html>
