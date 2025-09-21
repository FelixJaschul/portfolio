const canvas = document.getElementById('hexagon-canvas');
const ctx = canvas.getContext('2d');



let width = canvas.width = window.innerWidth;
let height = canvas.height = window.innerHeight;

window.addEventListener('resize', () => {
    width = canvas.width = window.innerWidth;
    height = canvas.height = window.innerHeight;
});

const hexagons = [];
const hexagonSize = 30;
const hexagonSpeed = 1;

class Hexagon {
    constructor(x, y) {
        this.x = x;
        this.y = y;
        this.size = hexagonSize;
        this.speedX = Math.random() * hexagonSpeed * 2 - hexagonSpeed;
        this.speedY = Math.random() * hexagonSpeed * 2 - hexagonSpeed;
    }

    update() {
        this.x += this.speedX;
        this.y += this.speedY;

        if (this.x < 0 || this.x > width) {
            this.speedX *= -1;
        }
        if (this.y < 0 || this.y > height) {
            this.speedY *= -1;
        }
    }

    draw() {
        ctx.beginPath();
        for (let i = 0; i < 6; i++) {
            const angle = Math.PI / 3 * i;
            const x = this.x + this.size * Math.cos(angle);
            const y = this.y + this.size * Math.sin(angle);
            ctx.lineTo(x, y);
        }
        ctx.closePath();
        ctx.strokeStyle = 'rgba(128, 128, 128, 0.5)';
        ctx.stroke();
    }
}

function init() {
    for (let i = 0; i < 100; i++) {
        hexagons.push(new Hexagon(Math.random() * width, Math.random() * height));
    }
}

function animate() {
    ctx.clearRect(0, 0, width, height);
    hexagons.forEach(hexagon => {
        hexagon.update();
        hexagon.draw();
    });
    requestAnimationFrame(animate);
}

init();
animate();