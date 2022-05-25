
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


class Program {
  public static void Main (string[] args) {
     //1.Determine a random integer from 1 to 100
    int min = 1;
    int max = 100;
     //2.Get an integer from the player
    Random random = new Random();
    int winNum = random.Next(min, max);
    bool win = false;

   do {
     //Print: "Welcome to the guessing game! Guess a number between 1 and 100!"
     Console.WriteLine("Choose a number between 1 and 100;");
     String s = Console.ReadLine();
       //3. If print messages "Too Low... Try Again" and "Too High... Try again" are sent to the console, add +1 to Attempts.
       //4. Determine if the Player integer is lower or higher than the integer from step 1.
        //If player integer is lower than the (1.)Integer, then print "Too Low... Try Again", get an integer from the player, and restart step (3.).

        //If player integer is higher than the (1.)Integer, then print"Too High.... Try Again", get an integer from the player, and restart step (3.).

        //If player integer is equal to the (1.)Integer, then print" Good Job" and "Play Again", and restart from step (1.).
     int i = int.Parse(s);

     if(i > winNum){

       Console.WriteLine("Too High... Try Again");

     } else if (i < winNum){

       Console.WriteLine("Too Low.... Try Again");

     } else if (i == winNum){

      Console.WriteLine("Good Job!");
      win = true;

     }

   } while (win == false);
   Console.WriteLine("Thank you for playing!");
   Console.WriteLine("press any key to exit....");
   Console.ReadKey(true);





    //Console.WriteLine("Enter Input");
    //string test = Console.ReadLine();
    //Console.WriteLine(test);
  }
}











