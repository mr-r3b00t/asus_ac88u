/*
Copyright (c) 2015 by Tom (http://codepen.io/TomJ1588/pen/jltcu)
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to
whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/
var W = 760, H = 430;
var particles = [];
var Smokeparticles = [];
var particle_count = 500;
var flamewidth = 660;
var canvas;
var ctx;
var timer = 0;
function showFire(){
canvas = document.getElementById("fire");
canvas.width = W;
canvas.height = H;
for(var i = 0; i < particle_count; i++)
{
particles.push(new particleFlame());
}
var smoke_count = 20;
for(var o = 0; o < smoke_count; o++)
{
Smokeparticles.push(new particleSmoke());
}
timer = setInterval(drawFlames, 100);
}
function stopFire(){
clearInterval(timer);
}
function particleSmoke()
{
this.speed = {x: -2.5+Math.random()*5, y: -17+Math.random()*3};
var locmin = (W/2)-flamewidth; var locmax = (W/2)+flamewidth;
this.location = {x: Math.random()*(locmin - locmax)+locmin, y: H};
this.radius = Math.random()*(5-10)+5;
this.life = 20+Math.random()*40;
this.remaining_life = this.life;
var b = Math.round(Math.random()*(120 - 255) + 120);
this.r = b;
this.g = b;
this.b = b;
}
function particleFlame()
{
this.speed = {x: -2.5+Math.random()*5, y: -17+Math.random()*10};
var locmin = (W/2)-(flamewidth/2); var locmax = (W/2)+(flamewidth/2);
this.location = {x: Math.random()*(locmax - locmin)+locmin, y: H};
this.radius = Math.random()*(50-100)+50;
this.life = 20+Math.random()*10;
this.remaining_life = this.life;
this.r = '255';
this.g = Math.round(Math.random()*(100 - 190) + 100);
this.b = Math.round(Math.random()*(10 - 30) + 10);
}
function drawFlames()
{
if (canvas.getContext){
ctx = canvas.getContext("2d");
}
ctx.globalCompositeOperation = "source-over";
ctx.fillStyle="rgba(0, 0, 0, 1)";
ctx.fillRect(0, 0, W, H);
ctx.globalCompositeOperation = "lighter";
for(var i = 0; i < particles.length; i++)
{
var p = particles[i];
ctx.beginPath();
p.opacity = Math.round(p.remaining_life/p.life*100)/100;
var gradient = ctx.createRadialGradient(p.location.x, p.location.y, 0, p.location.x, p.location.y, p.radius);
gradient.addColorStop(0, "rgba("+p.r+", "+p.g+", "+p.b+", "+p.opacity+")");
gradient.addColorStop(0.5, "rgba("+p.r+", "+p.g+", "+p.b+", "+p.opacity+")");
gradient.addColorStop(1, "rgba("+p.r+", "+p.g+", "+p.b+", 0)");
ctx.fillStyle = gradient;
ctx.arc(p.location.x, p.location.y, p.radius, Math.PI*2, false);
ctx.fill();
p.remaining_life--;
p.radius--;
p.location.x += p.speed.x;
p.location.y += p.speed.y;
if(p.remaining_life < 0 || p.radius < 0)
{
particles[i] = new particleFlame();
}
}
for(var i = 0; i < Smokeparticles.length; i++)
{
var s = Smokeparticles[i];
ctx.beginPath();
s.opacity = Math.round(s.remaining_life/s.life*100)/100
var gradient = ctx.createRadialGradient(s.location.x, s.location.y, 0, s.location.x, s.location.y, s.radius);
gradient.addColorStop(0, "rgba("+s.r+", "+s.g+", "+s.b+", "+s.opacity+")");
gradient.addColorStop(0.5, "rgba("+s.r+", "+s.g+", "+s.b+", "+s.opacity+")");
gradient.addColorStop(1, "rgba("+s.r+", "+s.g+", "+s.b+", 0)");
ctx.fillStyle = gradient;
ctx.arc(s.location.x, s.location.y, s.radius, Math.PI*2, false);
ctx.fill();
s.remaining_life--;
s.radius--;
s.location.x += s.speed.x;
s.location.y += s.speed.y;
if(s.remaining_life < 0 || s.radius < 0)
{
Smokeparticles[i] = new particleSmoke();
}
}
}

