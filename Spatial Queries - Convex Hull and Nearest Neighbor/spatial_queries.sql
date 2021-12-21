CREATE TABLE IF NOT EXISTS public.geonames
(
    name varchar(1000),
    gps GEOMETRY
);


-- Convex Hull Points
SELECT ST_AsText(ST_ConvexHull(
ST_Collect(
 ST_GeomFromText('MULTIPOINT(
-118.2825522 34.0304761,
-118.2828801  34.0216201,
-118.2837011 34.0201791,
-118.2829401 34.0194382,
-118.2854434 34.0205733,
-118.2854842 34.0187223,
-118.284160 34.0186851,
-118.2864351 34.0207954,
-118.2888887 34.0208745,
-118.2903431 34.0201623,
-118.2889691 34.0220171,
-118.2879761 34.0230921,
-118.2879001 34.0242881)')
)) );


truncate table public.geonames;
INSERT INTO public.geonames(
name, gps)
VALUES 
('Home','POINT(-118.2825522 34.0304761)'),
('Leavey Library','POINT(-118.2828801  34.0216201)'),
('Nazarian Pavilion','POINT(-118.2837011 34.0201791)'),
('Widney Alumni House','POINT(-118.2829401 34.0194382)'),
('Tommy Trojan Statue','POINT(-118.2854434 34.0205733)'),
('Marshall Business School','POINT(-118.2854842 34.0187223)'),
('USC Gould School of Law','POINT(-118.284160 34.0186851)'),
('USC Bookstores','POINT(-118.2864351 34.0207954)'),
('Viterbi School Of Engineering','POINT(-118.2888887 34.0208745)'),
('Leonard Davis School of Genrontology','POINT(-118.2903431 34.0201623)'),
('Cromwell Track and Field','POINT(-118.2889691 34.0220171)'),
('Brittingham intramural field','POINT(-118.2879761 34.0230921)'),
('Lyon Recreation Center','POINT(-118.2879001 34.0242881)');


-- 4 Nearest Neighbours
SELECT nn.name,ST_ASTEXT(local.gps) as Home, ST_ASTEXT(nn.gps) as Neighbor
FROM geonames as local, geonames as nn
WHERE local.name='Home' and nn.name <> 'Home'
ORDER BY ST_Distance(local.gps, nn.gps) ASC LIMIT 4;
