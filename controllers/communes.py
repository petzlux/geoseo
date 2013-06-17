import logging
import re
import locale
import codecs,ConfigParser

from pylons import url
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to

from geoadmin.model.search import Locations    

from mapfish.lib.filters.spatial import Spatial

from geoadmin.lib.base import *
from geoadmin.model.meta import Session

from geoadmin.model import layers_from_bid
from geoadmin.model import search
from geoadmin.model.vector import *

from geojson import FeatureCollection, dumps as geojson_dumps

try:
    from json import dumps as json_dumps
except:
    from simplejson import dumps as json_dumps

import logging
log = logging.getLogger(__name__)

class CommunesController(BaseController):

    def __before__(self):
        c.lang = request.params.get('lang', 'de')

        # locale "lu" does not exist and is replaced by "it"
        if c.lang == 'lu':
            c.lang = 'it'

        h.set_lang(c.lang)

        c.app_version = config['app_version']
        
        # common params for search, bbox and geometry
        self.layers = request.params.get('layers', '').split(',')

        # common params for bbox and geometry
        self.ids = request.params.get('ids', '').split(',')
        self._get_themes()
    def _fill_layers(self,items,theme_layers):
        #print "items " + str(items)
        #print "theme_layers " + str(theme_layers)
        #print self.layers
        #print self.groups
        for it in items:
            i=it.strip()
            if i in self.layers:
                #print "adding layer " + i
                if i not in theme_layers:
                    theme_layers.append(i)
            elif i in self.groups:
                #print "sending %s into recursion with layers %s" % (i,str(self.groups[i]))
                self._fill_layers(self.groups[i],theme_layers)
            else:
                #print "not found %s anywhere" % i
                pass
        return 
    def _get_layers_for_theme(self,theme):
        #print "theme " + theme
        theme_layers = []
        self._fill_layers(self.themes[theme],theme_layers)
        return theme_layers
    def _get_themes(self):
        cfg = ConfigParser.ConfigParser()
        cfg.readfp(codecs.open(config['themes.cfg'], 'r', 'utf8'))
        themes = []
        self.themes = {}
        self.layers = []
        self.groups = {}
        
        #print len(cfg.sections())
        
        for s in cfg.sections():
            try:
                name = s.split(":")[1].strip()
            except:
                name = ""
            if s.find('theme:')>-1:
                try:
                    self.themes[name]=cfg.get(s,'items').split(",")
                except:
                    #print "no items in theme %s " % name
                    pass
            elif s.find('layer:')>-1:
                self.layers.append(name)
            elif s.find('group:')>-1:
                try:
                    self.groups[name]=cfg.get(s,'items').split(",")
                except:
                    #print "no items in group %s" % name
                    pass
            else:
                #print "don't know where to put %s" % s
                pass
        for s in cfg.sections():
            if s.find('theme:') != -1 and \
                cfg.has_option(s, 'display_in_switcher') and \
                cfg.getboolean(s, 'display_in_switcher'):
                theme = s.replace('theme:', '')
                #if config['subdomain_themes'] != 'false':
                if 'false' != 'false':
                    if theme == 'main':
                        subdomain = 'map'
                    else :
                        subdomain = theme
                    u = 'http://%s.geoportail.lu/' % subdomain
                else:
                    u = url(controller='home', action='index',
                             theme=theme
                         )
                layers = self._get_layers_for_theme(theme)
                #print layers
                themes.append([theme, u,layers])
        c.themes = themes

    def communes(self):
        features= []
        for klass in layers_from_bid('communes'):
                for feature in Session.query(klass).order_by("name ASC"):
                        features.append(feature)
        c.features = features

        return render('/communes.mako')
    def commune(self,commune):
        c.commune = commune
        features= []
        for klass in layers_from_bid('communes'):
                for feature in Session.query(klass).filter("name = '%s'"%commune):
                        features.append(feature)
        c.features = features
        return render('/communes_commune.mako')
    def layer(self,commune,layer):
        c.commune = commune
        c.layer = layer
        features= []
        for klass in layers_from_bid('communes'):
                for feature in Session.query(klass).filter("name = '%s'"%commune):
                        features.append(feature)
        c.features = features
        return render('/communes_commune_layer.mako')
