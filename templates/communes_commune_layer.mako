# -*- coding: utf-8 -*-

<%inherit file="communes_base.mako" />
	
<%def name="title()">
   Geodonnees de la Commune de ${c.commune}
</%def> 

<script type="text/javascript">   
Ext.onReady(function() {
			communeID = ${ c.features[0].id };
			
	       	geo = new geoadmin.API({lang: 'en'});

		      //Erstellen eines MapPanels
            var mapWindow = geo.createMapPanel({	
				mapInfo: 
				{
					zoom: 6,
	           		easting:  77000,
		     		northing: 101000,
	           		bgOpacity: 100,
					bgLayer: 'webbasemap'
             	}
            });

            geo.searchUrl="http://api.geoportail.lu/locationsearch";
            
            var panel = new Ext.Panel({		 
           		id:'geoAPIPanel',
           		layout:'border',
           		height: 375,
           		renderTo:'map',
           		items: [Ext.apply(mapWindow, {region: 'center'})]
            });
			geo.addLayerToMap('communes');
			//geo.createTooltipFeature({
			//	tooltipUrl:'http://map.geoportail.lu/bodfeature/search',
			//requestOnlyVisibleLayers:true
			//});
			geo.showFeatures('communes',  communeID);
});
</script>
	
<ul class="breadcrumb">
	<li><a href="/communes/">Index des Communes</a><span class="divider">/</span></li>
	<li><a href="/communes/${c.commune}/">${c.commune}</a><span class="divider">/</span> </li>
	<li class="active"><a href="/communes/${c.commune}/"></a> ${_(c.layer)} </li>
</ul>

<%
    x = c.features[0].geom.centroid.x
    y = c.features[0].geom.centroid.y
%>

	<h2>Commune de ${c.commune} : ${_(c.layer)}</h2>

% for t in c.themes:
% if c.layer in t[2]:
<br><a href=${t[1]}?zoom=7&X=${y}&Y=${x}&layers=${c.layer}>${_(c.layer)} (${_(t[0])})</a>
% endif
% endfor

