package ri_2122;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import static ri_2122.Main.PROCESSING_MAIN;

public class Oscilloscope {
    private static final Logger LOGGER = LoggerFactory.getLogger(Oscilloscope.class.getName());
    private static Oscilloscope instance;
    private static final LinkedHashMap<String, Plot> plotMap = new LinkedHashMap<>();

    private Oscilloscope() {
    }

    public void addPlot(String title, int xPos, int yPos, int width, int height) {
        plotMap.put(title, new Plot(title, xPos, yPos, width, height));
    }

    public void plotVisible(String name, boolean val) {
        plotMap.get(name).setVisible(val);

    }

    public static synchronized Oscilloscope getInstance() {
        if (instance == null) {
            instance = new Oscilloscope();
        }
        return instance;
    }


    public void drawPlots() {
        String[] keys = plotMap.keySet().toArray(new String[0]);
        Plot plt;
        for(String key:keys){
            plt = plotMap.get(key);
            if(plt.isVisible()) plt.drawVal();
        }
    }

    public void setPlotBuffer(String title,int capacity){
        plotMap.get(title).setBufferCapacity(capacity);
    }

    public void allVisible(boolean toShow) {
        String[] keys = plotMap.keySet().toArray(new String[0]);
        for(String key:keys){
            plotMap.get(key).setVisible(toShow);

        }
    }

    public void addPoint(String title, float value, int lineRef) {
        plotMap.get(title).addValue(value,lineRef);
    }

    public void resetPlot() {
        String[] keys = plotMap.keySet().toArray(new String[0]);
        Plot plt;
        for(String key:keys){
            plt=plotMap.get(key);
            plt.resetValue();

        }
    }

    public void setBound(String title, float min, float max) {
        plotMap.get(title).setBoundYInf(min);
        plotMap.get(title).setBoundYSup(max);

    }
}