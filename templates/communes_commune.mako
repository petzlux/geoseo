## -*- coding: utf-8 -*-

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
					zoom: 6,
	           		easting:  77000,
		     		northing: 101000,
	           		bgOpacity: 100,
					bgLayer: 'webbasemap'
             	}
            });


            var panel = new Ext.Panel({		 
           		id:'geoAPIPanel',
           		layout:'border',
           		height: 375,
           		renderTo:'map',
           		items: [Ext.apply(mapWindow, {region: 'center'})]
            });

            geo.searchUrl="http://api.geoportail.lu/locationsearch";
            geo.addLayerToMap('communes');
            geo.addLayerToMap('communes_labels');
			geo.showFeatures('communes',  communeID);

});
</script>
	
<ul class="breadcrumb">
	<li><a href="/communes/">${_('communes')}</a> <span class="divider">/</span></li>
	<li class="active"><a href="/communes/${c.commune}/"></a> ${c.commune} </li>
</ul>

<%
    x = c.features[0].geom.centroid.x
    y = c.features[0].geom.centroid.y
 
%>


	<h2>${_('com_name')} : ${c.commune} </h2>

<p>
${_('geoseo_commune_txt')}
</p>

    <div class="row-fluid">	
		<div class="span5">
			<div id='map'></div>
		</div>
		<div class="span7">
			<h3>${_('themeswitcher.window_title')}</h3>
			${_('geoseo_themes_txt')}
			<div class="accordion" id="accordion2">
				% for t in c.themes:
				<div class="accordion-group-${_(t[0])}">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse-${t[0]}">
							${_('theme.'+t[0])}
						</a>
					</div>
					<div id="collapse-${t[0]}" class="accordion-body collapse">
						<div class="accordion-inner">
							% for l in t[2]:
								<br>
									<a href="/communes/${c.commune}/${l}?lang=${c.lang}">${_(t[2][l])}</a> 
									<a href="/${t[0]}?zoom=7&X=${y}&Y=${x}&layers=${l}">
								<i class="icon-share"> </i></a>
							% endfor
						</div>
					</div>
				</div>
				% endfor
			</div>
		</div>
    </div>
