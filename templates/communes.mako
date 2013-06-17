<html>
<head>
</head>
<body>
<title>Communes du Grand - Duche du Luxembourg</title>
<h1>Communes</h1>
% for f in c.features:
  <br> <a href="/communes/${f.name}">${f.name}</a>
% endfor
</body>
</html>
