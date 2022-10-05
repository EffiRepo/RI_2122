package ri_2122;

import static ri_2122.Main.PROCESSING_MAIN;

import processing.core.PApplet;
import processing.core.PGraphics;
import java.util.*;

public class Plot{

    private  float boundYSup;
    private float boundYInf;
    private  int titleHeight = 30;
    private int referenceLineColor;
    private  int gridColor;
    private int gridHeight;
    private int START_WINDOW;
    private int END_WINDOW;
    private final String title;
    private final int xPos;
    private final int yPos;
    private final int width;
    private final int height;
    private int titleBg;
    private int titleColor;
    private int gridLineColor;
    private int spacing = 25;
    private  int textSize = 18 ;
    private  PGraphics pGraphics;

    private float maxValue;
    private float minValue;
    private int canvasColor;
    private boolean visible = false;
    private static final float CURRENT_LINE_STROKE =1.2f;
    private static final int[] colorLine = new int[]{
             PROCESSING_MAIN.color(255,0,0,255),
            PROCESSING_MAIN.color(0,255,0,255),
               PROCESSING_MAIN.color(0,0,255,255)
    };
    private final ArrayList<ArrayList<Float>> valToPlot = new ArrayList<>(0);

    public Plot(String title, int xPos, int yPos, int width, int height)  {
        // Plot Title
        this.title = title;
        //Left top corner point
        this.xPos = xPos;
        this.yPos = yPos;
        //Width and Heigth canvas
        this.width = width;
        this.height = height;
        titleBg = PROCESSING_MAIN.color(214,182,75);
        gridLineColor = PROCESSING_MAIN.color(50,50,50);
        gridColor = PROCESSING_MAIN.color(255, 255, 204);
        canvasColor = PROCESSING_MAIN.color(0,0,0);
        referenceLineColor = PROCESSING_MAIN.color(204, 0, 0);
        setGridHeight();
        pGraphics = PROCESSING_MAIN.createGraphics(width,height);
        boundYSup=-1f;
        boundYInf=-1f;
        END_WINDOW = height-titleHeight;

    }

    public void setTitleBackground(int r, int g, int b){
        this.titleBg = PROCESSING_MAIN.color(r,g,b);

    }
    public void setTitleColor(int r, int g, int b){
        this.titleColor = PROCESSING_MAIN.color(r,g,b);

    }
    public void setGridBackgroundColor(int r, int g, int b){
        this.gridLineColor = PROCESSING_MAIN.color(r,g,b);

    }

    public String getTitle() {
        return title;
    }

    public int getxPos() {
        return xPos;
    }

    public int getyPos() {
        return yPos;
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public int getSpacing() {
        return spacing;
    }

    public void setSpacing(int spacing) {
        this.spacing = spacing;
    }

    public  int getTitleHeight() {
        return titleHeight;
    }

    public  void setTitleHeight(int titleHeight) {
        this.titleHeight = titleHeight;
    }

    public  int getTextSize() {
        return textSize;
    }

    public  void setTextSize(int textSize) {
        this.textSize = textSize;
    }

    public int getCanvasColor() {
        return canvasColor;
    }

    public void setCanvasColor(int canvasColor) {
        this.canvasColor = canvasColor;
    }

    public void setGridHeight(){
        this.gridHeight = height-titleHeight;
        this.END_WINDOW = gridHeight;
    }

    public int getEND_WINDOW() {
        return END_WINDOW;
    }

    public void setEND_WINDOW(int END_WINDOW) {
        this.END_WINDOW = END_WINDOW;
    }

    public float getGridHeight(){
        return gridHeight;
    }

    public int getGridColor() {
        return gridColor;
    }

    public void setGridColor(int gridColor) {
        this.gridColor = gridColor;
    }

    public int getReferenceLineColor() {
        return referenceLineColor;
    }

    public void setReferenceLineColor(int referenceLineColor) {
        this.referenceLineColor = referenceLineColor;
    }

    ArrayList<Float> minValues = new ArrayList<>(0);
    ArrayList<Float> maxValues = new ArrayList<>(0);
    public void drawVal() {

        if (visible) {
            pGraphics.beginDraw();
            pGraphics.stroke(canvasColor);
            drawBackground();
            /*
            Get Min and get Max to Plot
             */
            if(!valToPlot.isEmpty()) {

                for(ArrayList<Float> list: valToPlot) {
                    if(!list.isEmpty()){
                        minValues.add(Collections.min(list));
                        maxValues.add(Collections.max(list));
                    }
                }
                if(!minValues.isEmpty()) {
                    Float minVal = Collections.min(minValues);
                    Float maxVal = Collections.max(maxValues);
                    if(boundYInf!=-1){
                        minVal=boundYInf;
                        maxVal=boundYSup;
                    }
            /*
            Reference Line
             */
                    pGraphics.beginShape();
                    pGraphics.stroke(0);
                    pGraphics.strokeWeight(1f);
                    float scaling = PApplet.map(0,
                            minVal, maxVal,
                            END_WINDOW, (float) titleHeight);
                    pGraphics.line(0, scaling, width, scaling);
                    pGraphics.endShape();
            /*
            Plot Incoming Value
             */
                    int idx = 0;
                    for (ArrayList<Float> list : valToPlot) {
                        pGraphics.beginShape();
                        pGraphics.strokeWeight(CURRENT_LINE_STROKE);
                        pGraphics.stroke(colorLine[idx]);
                        scaleValue(list, minVal, maxVal, idx);
                        pGraphics.endShape();
                        idx++;
                    }
                }
            }
                pGraphics.endDraw();

                PROCESSING_MAIN.image(pGraphics, xPos, yPos);

        }
    }


    private void scaleValue(List<Float> valList, float min, float max, int idx) {
        if(!valList.isEmpty()) {
            float time = 0.0f;
            float step = 1f;
            for (Float aFloat : valList) {
                float scaledYValue = PApplet.map(aFloat, min, max, END_WINDOW, titleHeight);
                float scaledXValue = PApplet.map(time, 0, valList.size(), 0, width);
                pGraphics.fill(colorLine[idx]);
                pGraphics.vertex(scaledXValue, scaledYValue);
                pGraphics.noFill();
                time += step;
            }
        }
    }

    private void drawBackground(){
        // Text Title size
        pGraphics.textSize(textSize);
        //Title Header
        pGraphics.fill(titleBg);
        pGraphics.strokeWeight(2f);
        pGraphics.rect(0,0,width, titleHeight);
        pGraphics.noFill();
        // Writing Title
        pGraphics.fill(titleColor);
        pGraphics.text(title,width*0.5f, titleHeight *0.75f);
        pGraphics.noFill();
        // Drawing grid
        //Grid Canvas
        pGraphics.fill(gridColor);
        pGraphics.rect(0,titleHeight,width,gridHeight);
        //Line grid property
        pGraphics.strokeWeight(0.2f);
        pGraphics.stroke(gridLineColor);
        //Vertical Line
        for ( int i = 0 ; i < width ; i+=spacing) {
            pGraphics.line(i,titleHeight,i,height);
        }
        //Horizontal Line
        for ( int j = titleHeight ; j < height ; j+=spacing) {
            pGraphics.line(0,j,width,j);
        }
    }

    public void setVisible(boolean val) {
        visible = val;
    }

    public boolean isVisible() {
        return this.visible;
    }
    public float getCurrentLineStroke() {
        return CURRENT_LINE_STROKE;
    }

    public void setGridHeight(int gridHeight) {
        this.gridHeight = gridHeight;
    }


    public int getTitleBg() {
        return titleBg;
    }

    public void setTitleBg(int titleBg) {
        this.titleBg = titleBg;
    }

    public int getTitleColor() {
        return titleColor;
    }

    public void setTitleColor(int titleColor) {
        this.titleColor = titleColor;
    }

    public int getGridLineColor() {
        return gridLineColor;
    }

    public void setGridLineColor(int gridLineColor) {
        this.gridLineColor = gridLineColor;
    }

    public PGraphics getpGraphics() {
        return pGraphics;
    }

    public void setBufferCapacity(int capacity) {
        for(int i =1;i<=capacity;i++){
            valToPlot.add(new ArrayList<>(0));
        }

    }

    public void addValue(float value, int lineRef) {
        valToPlot.get(lineRef).add(value);
    }

    public void resetValue() {
        for(ArrayList<Float>list:valToPlot){
            list.clear();
        }
        minValues.clear();
        maxValues.clear();
    }

    public float getBoundYSup() {
        return boundYSup;
    }

    public float getBoundYInf() {
        return boundYInf;
    }

    public void setBoundYSup(float boundYSup) {
        this.boundYSup = boundYSup;
    }

    public void setBoundYInf(float boundYInf) {
        this.boundYInf = boundYInf;
    }
}