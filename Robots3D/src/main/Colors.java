package main;

public enum Colors {
    ACID_GREEN(218, 247, 166,255),
    DARK_YELLOW(255, 195, 0,255),
    ORANGE(255, 87, 51,255),
    DARK_RED(199, 0, 57,255),
    MAGENTA(144, 12, 63,255),
    VIOLET(88, 24, 69,255);
    private final int[] color;
    Colors(int r, int g, int b, int a) {
        this.color = new int[]{r, g, b, a};
    }
    public int[] getColor(){
        return color;
    }
}
