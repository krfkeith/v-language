package v;

public abstract class Vx extends RuntimeException {
    abstract String message();
    abstract void addLine(String var);
}
