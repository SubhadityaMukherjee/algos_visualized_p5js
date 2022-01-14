let field;
let rez = 40;
let cols = 0;
let rows = 0;
let ler = 1;
function setup(){
    createCanvas(1280, 720);
    cols=1 + width / rez;
    rows=1 + height / rez;
    field=processing2jsNewNDimArray([cols, rows]);
    randomSeed(0);
    for(let i = 0;i < cols;i++) {
        for(let j = 0;j < rows;j++) {
            field[i][j]=floor(random(2));
        }
    }
}

function linePVectorPVector(v1, v2){
    line(v1.x, v1.y, v2.x, v2.y);
}

function draw(){
    background(0);
    for(let i = 0;i < cols;i++) {
        for(let j = 0;j < rows;j++) {
            stroke(field[i][j] * 255);
            strokeWeight(rez * .4);
            point(i * rez, j * rez);
        }
    }
    for(let i = 0;i < cols - 1;i++) {
        for(let j = 0;j < rows - 1;j++) {
            let x = i * rez;
            let y = j * rez;
            let p = new p5.Vector(x, y);
            let q = new p5.Vector(x + rez, y);
            let r = new p5.Vector(x + rez, y + rez);
            let s = new p5.Vector(x, y + rez);
            let a = new p5.Vector();
            let b = new p5.Vector();
            let c = new p5.Vector();
            let d = new p5.Vector();
            if(ler == 1) {
                a=p5.Vector.lerp(p, q, 0.5);
                b=p5.Vector.lerp(q, r, 0.5);
                c=p5.Vector.lerp(r, s, 0.5);
                d=p5.Vector.lerp(s, p, 0.5);
            }
    else {
                a=new p5.Vector(x + rez * 0.5, y);
                b=new p5.Vector(x + rez, y + rez * 0.5);
                c=new p5.Vector(x + rez * 0.5, y + rez);
                d=new p5.Vector(x, y + rez * 0.5);
            }
            let state = getState(ceil(field[i][j]), ceil(field[i + 1][j]), ceil(field[i + 1][j + 1]), ceil(field[i][j + 1]));
            stroke(255);
            strokeWeight(1);
            switch(state){
                case 1:linePVectorPVector(c, d);
                break;
                case 2:linePVectorPVector(b, c);
                break;
                case 3:linePVectorPVector(b, d);
                break;
                case 4:linePVectorPVector(a, b);
                break;
                case 5:linePVectorPVector(a, d);
                linePVectorPVector(b, c);
                break;
                case 6:linePVectorPVector(a, c);
                break;
                case 7:linePVectorPVector(a, d);
                break;
                case 8:linePVectorPVector(a, d);
                break;
                case 9:linePVectorPVector(a, c);
                break;
                case 10:linePVectorPVector(a, b);
                linePVectorPVector(c, d);
                break;
                case 11:linePVectorPVector(a, b);
                break;
                case 12:linePVectorPVector(b, d);
                break;
                case 13:linePVectorPVector(b, c);
                break;
                case 14:linePVectorPVector(c, d);
                break;
            }
        }
    }
}

function getState(a, b, c, d){
    return a * 8 + b * 4 + c * 2 + d * 1;
}


function processing2jsNewNDimArray(dimensions) {
    if (dimensions.length > 0) {
        let dim = dimensions[0];
        let rest = dimensions.slice(1);
        let newArray = new Array();
        for (var i = 0; i < dim; i++) {
            newArray[i] = processing2jsNewNDimArray(rest);
        }
        return newArray;
     } else {
        return undefined;
     }
 }
