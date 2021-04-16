/*
 * Talk is cheap. Show me the code.
 */
package lab4.Exercise;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class InsuranceQuotation {

    private int vehid;
    private String type, ncd;

    public InsuranceQuotation() {
    }

    public InsuranceQuotation(int vehid, String type, String ncd) {
        this.vehid = vehid;
        this.type = type;
        this.ncd = ncd;
    }

    public int getVehid() {
        return vehid;
    }

    public void setVehid(int vehid) {
        this.vehid = vehid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNcd() {
        return ncd;
    }

    public void setNcd(String ncd) {
        this.ncd = ncd;
    }
    
    

    
    

    


}
