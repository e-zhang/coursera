public class Test {

    public static void main(String[] args) {
        for (int i=16; i < 32769; i=i*2)
        {
           Stopwatch timer = new Stopwatch();
           Timing.trial(i, 838464);
	   double time = timer.elapsedTime();
           System.out.println(time);
        } 
    
    }

}
