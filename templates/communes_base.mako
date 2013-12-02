# -*- coding: utf-8 -*-


<!DOCTYPE html>
<html lang="en">
  <head>

  <title>			${self.title()}
   </title>

  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


<link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap.css" rel="stylesheet"> 

 <link rel="stylesheet" type="text/css" href="/css/geoseo.ext-all.css" /> 
 <link rel="stylesheet" type="text/css" href="http://api.geoportail.lu/build/latest/xtheme-gray.css" /> 
 <link rel="stylesheet" type="text/css" href="http://api.geoportail.lu/build/latest/api.css" /> 
 <link rel="stylesheet" type="text/css" href="http://api.geoportail.lu/build/latest/MapFishApi_api.css" /> 
 <link rel="stylesheet" type="text/css" href="/css/geoadminGlobalsRemoved.css" /> 
 <script type="text/javascript" src="http://api.geoportail.lu/build/latest/ext-base.js"></script> 
 <script type="text/javascript" src="http://api.geoportail.lu/build/latest/ext-all.js"></script> 
 <script type="text/javascript" src="http://api.geoportail.lu/build/latest/geoadmin.js"></script> 
 <script type="text/javascript" src="http://api.geoportail.lu/api.js"></script> 

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setDomains", ["*.geoportail.lu","*.geoportal.lu"]]);
  _paq.push(["trackPageView"]);
  _paq.push(["enableLinkTracking"]);

  (function() {
    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://statistics.geoportail.lu/";
    _paq.push(["setTrackerUrl", u+"piwik.php"]);
    _paq.push(["setSiteId", "14"]);
    var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
    g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Piwik Code -->
	
    <!-- Le styles -->
      <style>
        body {
          padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
        footer {
          margin-top: 30px;
          padding-top: 10px;
          border-top: 1px solid #eee;
        }
         /* OpenLayers Fix with bootstrap */
		 img.olTileImage {
				max-width: none;
		}
		
		<style>
        /* Fixes for compatibility issues between extjs and bootstrap */

        .x-panel table, .x-window table {
          margin: 0;
          padding: 0;
          border-top: none;
          margin-bottom: 0px;
          margin-top: 0px;
          width: auto;
        }

        .x-panel td, .x-panel th, .x-window td, .x-window th{
          border-top: none;
          margin: 0; 
          padding: 0;
        }
        /*
        .x-panel-header {
          background:transparent;
          text-align: center;
          border-color: none;
        }
        */
        .x-panel-body {
          border: none;
          list-style:none;
        }
        .x-panel-body ul{
        list-style:none;
        }
         /*
        .x-toolbar {
          border: none;
          background: transparent;
        }

        .x-panel ul, .x-panel ol, .x-window ul, .xwindow ol {
          margin: 0;
        }
        */
        /*
        ul.x-tab-strip li {
          background: black;
          color: white;
        }

        .x-tab-strip-top .x-tab-right, .x-tab-strip-top .x-tab-left, .x-tab-strip-top .x-tab-strip-inner {
        background-image: none;
        background: none;
        color: white;
        }

        .x-tab-strip-active span.x-tab-strip-text {
          background: black;
          color: white;
        }

        .x-tab-strip span.x-tab-strip-text {
          color: white;
          padding-left: 15px;
          padding-right: 15px;
        }

        .x-tab-strip {
          border-bottom-width: 0;
        }

        ul.x-tab-strip-top {
            border-bottom-color: red;
            border-bottom-width: 0;
        }

        .x-panel-tbar-noheader .x-toolbar, .x-panel-mc .x-panel-tbar .x-toolbar {
            border-width: 0;
        }

        .x-panel-noborder .x-panel-bbar-noborder .x-toolbar {
            border-width: 0;
        }
        */
        /*
        .x-grid3-cell-inner, .x-grid3-hd-inner{
          height: 30px;
          padding-top: 10px;
          font-size: 14px;
        }
        */
        .x-grid3-hd-inner{
        height:20px;
        font-size: 14px;
        }
        .x-grid3-cell-inner{
        height:20px;
        font-size: 14px;
        padding-top:5px;
        }
        .hero-unit h1{
        font-size:40px
        }
        /*
        .x-tab-strip-wrap {
        background: #404040;
        }
        .x-tab-strip-wrap ul {
        background: #404040;
        }
        .x-tab-strip-wrap ul li {
        color:white;
        background: #404040;
        }

        ul.x-tab-strip li {
        margin-left: 0;
        }

        .x-tab-strip-top .x-tab-right {
        padding-left: 0;
        border-bottom: none;
        }

        .x-panel-noborder .x-panel-tbar-noborder .x-toolbar {
            border-width: 0;
        }

        .x-tab-panel-noborder .x-tab-panel-header-noborder {
            border-width: 0;
        }
        */
      </style>

 </head>
  <body>    
        <div class="header">
            <%def name="header()"></%def>${self.header()}
        </div>	
		<div class="container">
			${self.body()}
		</div> <!-- /container -->
		<div class="footer">
			<%def name="footer()">
				${self.footer()}
			</%def>
		</div>
  </body>
  
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
   <!-- Latest compiled and minified JavaScript -->

 <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/js/bootstrap.js"></script> 
</html>

