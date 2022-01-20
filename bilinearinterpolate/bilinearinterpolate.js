let a = 0;
let b = 0;
let c = 0;
let d = 0;
function bilinterp(a, b, c, d, alpha, beta){
    return ((1 - beta) * (1 - alpha) * a) + (alpha * beta * c) + (alpha * (1 - beta) * b) + (beta * (1 - alpha) * d);
}

function setup(){
    createCanvas(640, 360);
    noStroke();
}

function draw(){
    background(51);
    c=600;
    d=200;
    a=bilinterp(mouseX, mouseY, c, c, 0.2, 0.2);
    b=bilinterp(mouseX, mouseY, d, d, 0.2, 0.2);
    fill(255);
    stroke(255);
    ellipse(a, b, 33, 33);
}

