# -*- coding: utf-8 -*-

<%inherit file="communes_base.mako" />
	
<%def name="title()">
   ${_('geoseo_communes_page_title')} ${c.commune}
</%def> 

<script type="text/javascript">   
Ext.onReady(function() {
			communeID = ${ c.features[0].id };
			
	       	geo = new geoadmin.API({lang: 'en'});

            var mapWindow = geo.createMapPanel({	
				mapInfo: 
				{
					zoom: 5,
	           		easting:  ${c.features[0].geom.centroid.x},
		     		northing: ${c.features[0].geom.centroid.y},
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
            geo.addLayerToMap('communes_labels');
            geo.addLayerToMap('${c.layer}');
			//geo.createTooltipFeature({
			//	tooltipUrl:'http://map.geoportail.lu/bodfeature/search',
			//requestOnlyVisibleLayers:true
			//});
		//	geo.showFeatures('communes',  communeID);
        //    geo.map.layers[6].removeFeatures();

});
</script>
	
<ul class="breadcrumb">
	<li><a href="/communes/">${_('communes')}</a><span class="divider">/</span></li>
	<li><a href="/communes/${c.commune}/">${c.commune}</a><span class="divider">/</span> </li>
	<li class="active"><a href="/communes/${c.commune}/"></a> ${_(c.layer)} </li>
</ul>

<%
    x = c.features[0].geom.centroid.x
    y = c.features[0].geom.centroid.y
%>

	<h2>${_('com_name')} : ${c.commune} -> ${_(c.layerlabel)}</h2>
    <p>
        ${_('geoseo_commune_layer_txt')}
    </p>
    <div class="row-fluid">    
        <div class="span5">
            <div id='map'></div>
        </div>
        <div class="span7">
% for t in c.themes:
% if c.layer in t[2]:
<br><a href=${t[1]}?zoom=7&X=${y}&Y=${x}&layers=${c.layer}>${_(c.layerlabel)} (${_('geoseo_theme')} ${_('theme.'+t[0])})</a>
% endif
% endfor

</div>
</div>

