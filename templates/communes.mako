## -*- coding: utf-8 -*-

<%inherit file="communes_base.mako"/>
<%def name="title()">
   Index des Communes
</%def> 
<%def name="body()">

<ul class="breadcrumb">
	<li class="active">Index des Communes</li>
</ul>

<h2>Communes du Grand-Duche de Luxembourg</h2>

<p>
Veuillez ci-dessous trouver des liens pour chaque commune du Grand-Duche. Vous trouverez des informations concernant les couches d'informations distribuees par l'Administration du Cadastre et de la Topographie du Luxembourg.
</p>
<%
    first = True
%>

% for f in c.features:
	% if first == True:
		<a href="/communes/${f.name}">${f.name}</a>
	<% first = False %>		
	% else:
		| <a href="/communes/${f.name}">${f.name}</a>
	% endif
% endfor

</%def>
