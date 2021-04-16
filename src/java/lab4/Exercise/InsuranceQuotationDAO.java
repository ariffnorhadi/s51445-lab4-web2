/*
 * Talk is cheap. Show me the code.
 */
package lab4.Exercise;

import lab4.Exercise.InsuranceQuotation;
import lab4.Exercise.VehicleDAO;
import lab4.Exercise.Vehicle;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class InsuranceQuotationDAO {

    /**
     *
     * @param i
     * i is the Instance of InsuranceQuotation class
     * @return insurance
     * Market Price of the vehicle is retrieved from the plate
     * of the vehicle. By using Vehicle class, a vehicle instance is created to
     * get the details of the vehicle by using VehicleDAO.
     */
    public static double calculateQuotation(InsuranceQuotation i) {
        double insurance = 0;

        Vehicle vehQuo;
        VehicleDAO vehQdao = new VehicleDAO();
        vehQuo = vehQdao.getVehicle(i.getVehid());
        double marketPrice = vehQuo.getPrice();

        if (i.getType().equals("1")) {
            switch (i.getNcd()) {
                case "55":
                    insurance = 0.018 * marketPrice;
                    return (insurance);
                case "35":
                    insurance = 0.024 * marketPrice;
                    return (insurance);
                case "25":
                    insurance = 0.03 * marketPrice;
                    return (insurance);
                case "10":
                    insurance = 0.038 * marketPrice;
                    return (insurance);
                default:
                    break;
            }

        } else {
            switch (i.getNcd()) {
                case "55":
                    insurance = 0.012 * marketPrice;
                    return (insurance);
                case "35":
                    insurance = 0.018 * marketPrice;
                    return (insurance);
                case "25":
                    insurance = 0.025 * marketPrice;
                    return (insurance);
                case "10":
                    insurance = 0.033 * marketPrice;
                    return (insurance);
                default:
                    break;
            }
        }

        return insurance;

    }

}
