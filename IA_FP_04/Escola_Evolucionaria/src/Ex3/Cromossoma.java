package Ex3;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Cromossoma implements Comparable<Cromossoma>{
    protected double a;
    protected double b;
    protected double c;
    protected double d;
    protected double e;

    public Cromossoma() {
        Random r = new Random();
        this.a = (-9) + (9 - (-9)) * r.nextDouble();
        this.b = (-9) + (9 - (-9)) * r.nextDouble();
        this.c = (-9) + (9 - (-9)) * r.nextDouble();
        this.d = (-9) + (9 - (-9)) * r.nextDouble();
        this.e = (-9) + (9 - (-9)) * r.nextDouble();
        
        /*
        this.a = new Random().nextInt(9 - (-9)) + (-9);
        this.b = new Random().nextInt(9 - (-9)) + (-9);
        this.c = new Random().nextInt(9 - (-9)) + (-9);
        this.d = new Random().nextInt(9 - (-9)) + (-9);
        */
    }

    public double fitness() {
        List<Double> targetPoints = Arrays.asList(new Double[]{2.000, 2.155, 1.640, 0.485, -1.280, -3.625, -6.520, -9.935,
            -13.840, -18.205, -23.000, -28.195, -33.760, -39.665, -45.880, -52.375, -59.120, -66.085, -73.240, -80.555, 
            -88.000, -95.545, -103.160, -110.815, -118.480, -126.125, -133.720, -141.235, -148.640, -155.905, -163.000, 
            -169.895, -176.560, -182.965, -189.080, -194.875, -200.320, -205.385, -210.040, -214.255, -218.000, -221.245, 
            -223.960, -226.115, -227.680, -228.625, -228.920, -228.535, -227.440, -225.605, -223.000, -219.595, -215.360, 
            -210.265, -204.280, -197.375, -189.520, -180.685, -170.840, -159.955, -148.000, -134.945, -120.760, -105.415, 
            -88.880, -71.125, -52.120, -31.835, -10.240, 12.695, 37.000, 62.705, 89.840, 118.435, 148.520, 180.125, 
            213.280, 248.015, 284.360, 322.345, 362.000, 403.355, 446.440, 491.285, 537.920, 586.375, 636.680, 688.865, 
            742.960, 798.995, 857.000, 917.005, 979.040, 1043.135, 1109.320, 1177.625, 1248.080, 1320.715, 1395.560, 
            1472.645, 1552.000});

        double sum = 0.0;
        double fitness = 0.0;
        int count = 0;
        
        for (int i = 0; i <= 100; i++) {
            sum += Math.pow(targetPoints.get(i) - ((Math.pow(this.a, 4) * i + 
                    Math.pow(this.b, 3) * i - (Math.pow(this.c, 2)) * i + this.d * i + this.e)), 2);
            count++;
        }
        
        fitness = Math.sqrt(sum / count);
        
        return fitness;
    }
    
    @Override
    public int compareTo(Cromossoma cro) {
        if (cro.fitness() < this.fitness()){
            return 1;
        } else if (cro.fitness() > this.fitness()){
            return -1;
        } else {
            return 0;
        }
    }
    
    @Override
    public String toString() {
        String s = "";
        s = "Função: y = " + this.a + "x^4 + " + this.b + "x^3 + " + this.c + "x^2" + this.d + "x + " + this.e + "\n";
        s += "Fitness: " + this.fitness();
        
        return s;
    }
}
