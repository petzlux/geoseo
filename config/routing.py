#a -*- coding: utf-8 -*-
"""Routes configuration

The more specific and detailed routes should be defined first so they
may take precedent over the more generic routes. For more information
refer to the routes manual at http://routes.groovie.org/docs/
"""
from pylons import config
from routes import Mapper

def make_map():
    """Create, configure and return the routes Mapper"""
    map = Mapper(directory=config['pylons.paths']['controllers'],
                 always_scan=config['debug'])

    # The ErrorController route (handles 404/500 error pages); it should
    # likely stay at the top, ensuring it can always be resolved
    map.connect('error/:action/:id', controller='error')

    # CUSTOM ROUTES HERE
    #from geoadmin.controllers import profile
    #profile.add_routes(map)
    map.connect('/profile.csv', controller='profile', action='csv')
    map.connect('/profile.json', controller='profile', action='json')
    map.connect('/profile', controller='profile', action='index')    
    map.connect('/communes', controller='communes', action='communes')    
    map.connect('/communes/:commune', controller='communes', action='commune')    
    map.connect('/communes/:commune/:layer', controller='communes', action='layer')    

    map.connect('/login_form', controller='login', action='login')
    map.connect('/checker/:action', controller='checker')
    map.connect('/locationsearch/:action', controller='locationsearch')
    map.connect('/locationsearchexpress/:action', controller='locationsearchexpress')
    map.connect('/perimetersearch/:action', controller='perimetersearch')
    map.connect('/bodfeature/:action', controller='bodfeature')
    map.connect('/elevation/:action', controller='elevation')
    map.connect('/selection/:action', controller='selection')
    map.connect('/perimeter/:action', controller='perimeter')
    map.connect('/shorten',controller='shorten')
    map.connect('/wms/:layer',controller='wms')
    map.connect('/measurement/:action',controller='measurement')
    map.connect('/sketch/:action',controller='sketch')
    map.connect('/gpx/:action', controller='gpx')
    map.connect('/router/:action', controller='router')
    map.connect('/routing', controller='home',action='routing')
    map.connect('/login', controller='login', action='index')
    map.connect('/checkLogin', controller='login', action='checkLogin')
    map.connect('/mobile_layers', controller='home', action='mobile_layers')
    map.connect('/bglayers', controller='home', action='bglayers')
    map.connect('/', controller='home', action='index')
    map.connect('/mymaps', controller='mymaps', action='create',
        conditions=dict(method=['POST']))
    map.connect('/mymaps', controller='mymaps', action='index',
        conditions=dict(method=['GET']))
    map.connect('/mymaps/:id', controller='mymaps', action='map',
        conditions=dict(method=['GET']))
    map.connect('/mymaps/:id', controller='mymaps', action='update',
        conditions=dict(method=['PUT']))
    map.connect('/mymaps/:id', controller='mymaps', action='delete',
        conditions=dict(method=['DELETE']))
    map.connect('/mymaps/export', controller='mymaps', action='export',
        conditions=dict(method=['POST']))
    map.connect('/mymaps/upload_image', controller='mymaps', action='upload_image',
        conditions=dict(method=['POST']))
    map.connect('/mymaps/{id}/comment', controller='mymaps', action='comment',
                conditions=dict(method=['POST']))
    map.connect('/mymaps/{id}/rate', controller='mymaps', action='rate',
                conditions=dict(method=['GET']))
    map.connect('/mymaps/{id}/features', controller='mymaps', action='features')
    map.connect('/mymaps/{id}/map', controller='mymaps', action='map_info')
    
    map.connect('/upload/:action', controller='upload')
    map.connect('/sendbymail', controller='mobile', action="send_by_mail")
    map.connect('/mobile_export', controller='mobile', action='export')
    map.connect('/user', controller='home', action='user')
    # this route doesn't do anything.
    # It's an helper to build route to mobile url managed by apache.
    map.connect('/mobile', controller='home', action='mobile')
    # we use a specific route for theme='main' to make
    # url(controller='home', action='index', theme='main')
    # return '/' instead of '/main'
    map.connect('/', controller='home', action='index', theme='main')
    map.connect('/:theme.js', controller='home', action='js')
    map.connect('/:theme', controller='home', action='index')

    return map
