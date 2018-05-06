package beans;

public class Service {
    private int id;
    private String name;
    private String category;
    private double price;

    public Service() {
        this.name = "none";
        this.category = "none";
        this.price = 0;
    }

    public Service(String name, String category, double price) {
        this.name = name;
        this.category = category;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
