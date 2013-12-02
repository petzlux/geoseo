## -*- coding: utf-8 -*-

<%inherit file="communes_base.mako" />
	
<%def name="title()">Geodonnees de la Commune de ${c.commune}</%def>

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
	<li><a href="/communes/">Index des Communes</a> <span class="divider">/</span></li>
	<li class="active"><a href="/communes/${c.commune}/"></a> ${c.commune} </li>
</ul>

<%
    x = c.features[0].geom.centroid.x
    y = c.features[0].geom.centroid.y
%>


	<h2>Commune de ${c.commune} </h2>
    <div class="row-fluid">	
		<div class="span5">
			<div id='map'></div>
		</div>
		<div class="span7">
			<div class="accordion" id="accordion2">
				% for t in c.themes:
				<div class="accordion-group-${_(t[0])}">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse-${_(t[0])}">
							${_(t[0])}
						</a>
					</div>
					<div id="collapse-${_(t[0])}" class="accordion-body collapse">
						<div class="accordion-inner">
							% for l in t[2]:
								<br>
									<a href="/communes/${c.commune}/${l}">${_(l)}</a> 
									<a href="/${_(t[0])}?zoom=7&X=${y}&Y=${x}&layers=${l}">
								<i class="icon-share"> </i></a>
								
								
								
							% endfor
						</div>
					</div>
				</div>
				% endfor
			</div>
		</div>
    </div>
	
			${c.parcelles}
	
<% first = True %>
% for p in c.parcelles:
	% if first == True:
		<a href="">${_(p[0])}</a>
	<% first = False %>		
	% else:
		| <a href="">${_(p[0])}</a>
	% endif
% endfor
	
	
	
	
	