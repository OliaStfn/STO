package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Languages {

    public Languages() {
    }

    public Properties getText() {
        Properties property = new Properties();

        InputStream fis = null;
        try {
            String filename = "languages.properties";
            fis = getClass().getClassLoader().getResourceAsStream(filename);
            property.load(fis);

        } catch (IOException e) {
        }
        return property;
    }
}
