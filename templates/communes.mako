## -*- coding: utf-8 -*-

<%inherit file="communes_base.mako"/>
<%def name="title()">
  ${_('communes')}
</%def> 
<%def name="body()">

<ul class="breadcrumb">
	<li class="active">${_('communes')}</li>
</ul>

<h2>${_('communes_gdl')}</h2>

<p>
${_('geoseo_communes_txt')}
</p>
<%
    first = True
    if c.lang=='it' or c.lang=='lu':
        c.lang='lb'
%>

% for f in c.features:
	% if first == True:
		<a href="/communes/${f.name}?lang=${c.lang}">${f.name}</a>
	<% first = False %>		
	% else:
		| <a href="/communes/${f.name}?lang=${c.lang}">${f.name}</a>
	% endif
% endfor

</%def>
