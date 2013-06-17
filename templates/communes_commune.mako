<html>
<head>
</head>
<body>
<title>Communes du Grand - Duche du Luxembourg</title>
<h1>Commune de ${c.commune} </h1>

<% 
for f in c.features:
    x = f.geom.centroid.x
    y = f.geom.centroid.y
%> 

% for t in c.themes:
     <h2><a href=${t[1]}?zoom=7&X=${y}&Y=${x}>${_(t[0])}</a></h2>
% for l in t[2]:
      <br><a href=/communes/${c.commune}/${l}>${_(l)}</a>
% endfor 
% endfor

</body>
</html>
