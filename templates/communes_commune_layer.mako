<html>
<head>
</head>
<body>
<title>Communes du Grand - Duche du Luxembourg</title>
<h1>Commune de ${c.commune} - ${_(c.layer)}</h1>

<% 
for f in c.features:
    x = f.geom.centroid.x
    y = f.geom.centroid.y
%> 


% for t in c.themes:
% if c.layer in t[2]:
<br><a href=${t[1]}?zoom=7&X=${y}&Y=${x}&layers=${c.layer}>${_(c.layer)} (${t[0]})</a>
% endif
% endfor

</body>
</html>
