import java.util.ArrayList;
class Publisher {
    private final ArrayList<Subscriber> subs = new ArrayList<>();
    public void sub(Subscriber sub) {
        this.subs.add(sub);
    }
    public void unsub(Subscriber sub) {
        this.subs.remove(sub);
    }
    public void pub(String data) {
        for (Subscriber sub : this.subs) {
            sub.message(data);
        }
    }
}
class Subscriber {
    private final String name;

    public Subscriber(String name) {
        this.name = name;
    }
    public void message(String data) {
        System.out.println(name + " received data: " + data);
    }
}
class Main {
    public static void main(String[] args) {
        Publisher pub = new Publisher();
        Subscriber subOne = new Subscriber("SubOne");
        Subscriber subTwo = new Subscriber("SubTwo");
        Subscriber subThree = new Subscriber("SubThree");
        pub.sub(subOne);
        pub.sub(subTwo);
        pub.sub(subThree);
        pub.pub("Some Data");
        pub.unsub(subThree);
        pub.pub("Other Data");
    }
}