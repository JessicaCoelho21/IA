package Ex3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Ex3 {

    public static void main(String[] args) {
        List<Cromossoma> gen1 = new ArrayList<>(100);
        
        for (int i = 0; i < 100; i++){
            gen1.add(new Cromossoma());
        }
        
        //Ordenar ascendentemente por fitness, porque é um problema de maximização
        Collections.sort(gen1, Collections.reverseOrder());

        //Imprimir as 3 melhores soluções
        for (int i = 0; i < 3; i++){
            System.out.println(gen1.get(i));
        }
    }
}
