package Ex1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Ex1 {

    public static void main(String[] args) {
        System.out.println("Top 3/100 (versão imperativa):");
        
        //Criar lista com 100 chromossomas
        List<Cromossoma> gen1 = new ArrayList<>(100);
        for (int i=0; i<100; i++){
            gen1.add(new Cromossoma());
        }
            
        //Ordenar ascendentemente por fitness, porque é um problema de maximização
        Collections.sort(gen1, Collections.reverseOrder());

        //Imprimir as 3 melhores soluções
        for (int i=0; i<3; i++){
            System.out.println(gen1.get(i));
        }

        System.out.println("\n\nTop 3/100 (versão funcional):");

        //Bonus: Versão funcional :)
        List<Cromossoma> gen1_func = Stream.generate(() -> new Cromossoma())
                .limit(100)
                .sorted((x, y)->Double.compare(y.getFitness(), x.getFitness()))
                .limit(3)
                .collect(Collectors.toList());
        
        gen1_func.forEach(x -> System.out.println(x));
    } 
}
