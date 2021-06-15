public class DVD {
    public String name;
    public int releaseYear;
    public String director;

    public DVD (String name, int releaseYear,String director){
        this.name = name;
        this. releaseYear = releaseYear;
        this.director = director;
    }

   public String toString() {
       System.out.println(
                this.name + ", directed by " + this.director + ", released in " + this.releaseYear);
        return null;
   }


public static void main (String[] args){

        DVD[] dvdObject = new DVD[6];

    dvdObject.toString();
}
}