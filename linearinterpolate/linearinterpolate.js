let x = 0;
let y = 0;
function linterp(x, pos, fraction){
    return (1 - fraction) * pos + fraction * x;
}

function setup(){
    createCanvas(640, 360);
    noStroke();
}

function draw(){
    background(51);
    x=linterp(x, mouseX, 0.95);
    y=linterp(y, mouseY, 0.95);
    fill(255);
    stroke(255);
    ellipse(x, y, 66, 66);
}

