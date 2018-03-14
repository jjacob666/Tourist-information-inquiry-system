package city;

public class CityBean {
    public String cityname = "";
    public String citylist;


    public void setBroCities(String str) {
        citylist=str;
    }

    public String getCityList(){
        return citylist;
    }

    public String getCityName() {
        return this.cityname;
    }
}
