package Ex1;

import java.util.Random;

import static java.lang.Math.sin;
import static java.lang.Math.sqrt;

public class Cromossoma implements Comparable<Cromossoma> {
    protected double x;
    protected double y;

    /**
     * Construtor que gera uma nova solução, aleatória
     */
    public Cromossoma() {
        this.x = new Random().nextDouble() * 200 - 100;
        this.y = new Random().nextDouble() * 200 - 100;
    }

    public double getFitness(){
        double a = Math.sqrt(this.x * this.x + this.y * this.y);
        double b = Math.pow(Math.sin(a), 2) - 0.5;
        double c = 1 + 0.001 * Math.pow(this.x * this.x + this.y * this.y, 2);

        //return 0.5 + b / c;

        return (0.5 + ((Math.pow(sin(sqrt(this.x * this.x + this.y * this.y)), 2) - 0.5)
                /Math.pow(1.0 + 0.001 * (this.x * this.x + this.y * this.y), 2)));
    }

    /**
     * Para permitir ordenar utilizando a API de Java
     * @param o
     * @return
     */
    @Override
    public int compareTo(Cromossoma o) {
        if (o.getFitness() < this.getFitness()){
            return 1;
        } else if (o.getFitness() > this.getFitness()){
            return -1;
        } else return 0;
    }

    @Override
    public String toString() {
        return "Cromossoma{" +
                "x=" + this.x +
                ", y=" + this.y +
                "}, fitness: " + this.getFitness();
    }
}
