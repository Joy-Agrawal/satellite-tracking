id = input('Enter NORAD Id:');
%Search NORAD Id from this url https://celestrak.com/satcat/
license = input('Enter your license in single inverted comma');
%Log onto https://www.n2yo.com/ and input your license Id
Init = 'https://api.n2yo.com/rest/v1/satellite/positions/';
pos = '/41.702/-76.014/0/2/';
Init = strcat(Init, num2str(id), pos, '&apiKey=', license);
urlwrite(Init, 'sat.json');
f = fileread('sat.json');
f = split(f, '"');
x = f(15);
y = f(17);
x = char(x);
y = char(y);
xm = length(x);
ym = length(y);
x = str2num(x(2:xm-1));
y = str2num(y(2:ym-1));
map = worldmap("World");
load coastlines
plotm(coastlat,coastlon)
geoshow(x, y, 'Marker', '.', 'Color', 'red')
delete('sat.json')
p = "Latitude:" + x;
disp(p)
p = "Longitude:" + y;
disp(p)