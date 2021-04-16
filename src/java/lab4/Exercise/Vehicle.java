/*
 * Talk is cheap. Show me the code.
 */
package lab4.Exercise;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Vehicle {

    public int id, cust_id;
    public String plate, type, brand;
    public double price;

    public Vehicle() {
    }

    public Vehicle(int id) {
        this.id = id;
    }

    public Vehicle(int id, int cust_id, String plate, String type, String brand, double price) {
        this.id = id;
        this.cust_id = cust_id;
        this.plate = plate;
        this.type = type;
        this.brand = brand;
        this.price = price;
    }
    
    

    public Vehicle(int id, String plate, String type, String brand, double price) {
        this.id = id;
        this.plate = plate;
        this.type = type;
        this.brand = brand;
        this.price = price;
    }

    /**
     * This constructor is used for ADD purpose
     *
     * @param custid
     * @param price
     * @param plate
     * @param type
     * @param brand
     */
    public Vehicle(int custid, double price, String plate, String type, String brand) {
        this.cust_id = custid;
        this.plate = plate;
        this.type = type;
        this.brand = brand;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
