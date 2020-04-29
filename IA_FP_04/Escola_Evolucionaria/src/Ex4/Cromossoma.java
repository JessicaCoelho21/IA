package Ex4;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

public class Cromossoma implements Comparable<Cromossoma> {

    List<Coordenadas> rota = new ArrayList<>();
    Coordenadas start;
    Coordenadas end;
    private final static int min = 0;
    private final static int maxX = 37;
    private final static int maxY = 49;

    public Cromossoma(Coordenadas start, Coordenadas end) {
        this.start = start;
        this.end = end;

        this.rota.add(start);
        Random r = new Random();

        Coordenadas i = null;
        int currentX = start.getX();

        do {
            i = new Coordenadas((currentX + 1), (r.nextInt((this.maxY - this.min) + 1) + this.min));
            currentX = i.getX();
            this.rota.add(i);
        } while (currentX < end.getX() && (i.getX() != end.getX() || i.getY() != end.getY()));
    }

    public double fitness() {
        Iterator<Coordenadas> itr = rota.iterator();
        int result = 0;
        Coordenadas current = itr.next();

        while (itr.hasNext()) {
            Coordenadas tmp = itr.next();
            result += Math.abs(current.getX() - tmp.getX()) + Math.abs(current.getY() - tmp.getY()) + 4 * Math.abs(Ex4.mapa[current.getY()][current.getX()] - Ex4.mapa[tmp.getY()][tmp.getX()]);
            current = tmp;
        }

        if (!isValid()) {
            result -= 1000;
        }

        return result;
    }

    public boolean isValid() {
        Coordenadas finalPosition = this.rota.get(this.rota.size() - 1);
        
        if (finalPosition.getX() == this.end.getX() && finalPosition.getY() == this.end.getY()) {
            return true;
        }

        return false;
    }

    @Override
    public String toString() {
        Iterator<Coordenadas> itr = this.rota.iterator();
        String result = "";

        while (itr.hasNext()) {
            result += itr.next() + " | ";
        }

        return result;
    }

    @Override
    public int compareTo(Cromossoma o) {
        if (o.fitness() < this.fitness()) {
            return 1;
        } else if (o.fitness() > this.fitness()) {
            return -1;
        } else {
            return 0;
        }
    }
}
